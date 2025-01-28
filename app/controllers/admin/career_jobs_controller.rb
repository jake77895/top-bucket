class Admin::CareerJobsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_career_job, only: [:show, :edit, :update, :destroy]
  before_action :set_dropdown_values, only: [:new, :edit, :step_one]

  def index
    @career_jobs = CareerJob.includes(:career_compensations).order(created_at: :desc)
  end

  def step_one
    @companies = Company.all.order(:name)
    @locations = Location.all.order(:name)
    @industries = PositionType.all.order(:name) # Assuming PositionType represents industries
  end
  
  def save_step_one
    # Permit and process parameters
    session[:jobs] = params.require(:career_jobs).to_unsafe_h.values.map do |job|
      {
        company: Company.find_by(id: job["company_id"])&.name,
        location: Location.find_by(id: job["location_id"])&.name,
        industry: PositionType.find_by(id: job["industry_id"])&.name,
        years_at_job: job["years_at_job"],
        start_year: job["start_year"]
      }
    end
  
    redirect_to step_two_admin_career_jobs_path
  end
  
  def step_two
    unless session[:jobs].present?
      redirect_to step_one_admin_career_jobs_path, alert: "Please complete Step 1 first."
      return
    end
  
    @career_jobs = session[:jobs].map do |job|
      next if job["company"].blank? || job["location"].blank? || job["industry"].blank?
  
      # Find the relevant records
      company = Company.find_by(name: job["company"])
      location = Location.find_by(name: job["location"])
      position_type = PositionType.find_by(name: job["industry"])
  
      # Skip if any of these are missing
      next unless company && location && position_type
  
      # Fetch groups
      matching_groups = Group.where(
        company_id: company.id,
        location_id: location.id,
        position_type_id: position_type.id
      ).order(:name)
  
      # Fallback logic for groups
      if matching_groups.empty?
        matching_groups = Group.where(
          position_type_id: position_type.id,
          position_type_default: true
        ).order(:name)
      end
  
      # Fetch job levels
      matching_job_levels = JobLevel.where(
        company_id: company.id,
        position_type_id: position_type.id
      ).order(:name)
  
      # Fallback logic for job levels
      if matching_job_levels.empty?
        matching_job_levels = JobLevel.where(
          position_type_id: position_type.id,
          is_position_type_default: true
        ).order(:name)
  
        if matching_job_levels.empty?
          matching_job_levels = JobLevel.where(is_global_default: true).order(:name)
        end
      end
  
      # Build the CareerJob object
      career_job = CareerJob.new(
        company: job["company"],
        location: job["location"],
        industry: job["industry"],
        years_at_job: job["years_at_job"],
        start_year: job["start_year"]
      )
  
      # Attach `matching_groups` and `matching_job_levels` to the object
      career_job.matching_groups = matching_groups
      career_job.matching_job_levels = matching_job_levels
  
      # Build nested CareerCompensations
      career_job.years_at_job.to_i.times { career_job.career_compensations.build }
  
      career_job
    end.compact # Remove nil values
  end
  
  
  
  
  
  
  
  
  

  def create
    Rails.logger.debug "Incoming Career Jobs Params: #{params[:career_jobs].inspect}"
  
    @career_jobs = params.require(:career_jobs).to_unsafe_h.values.map do |job_params|
      # Extract career_compensations separately
      compensation_params = job_params.delete("career_compensations")
      Rails.logger.debug "Processing Job Params: #{job_params.inspect}"
      Rails.logger.debug "Extracted Compensation Params: #{compensation_params.inspect}"
  
      # Permit the job parameters
      permitted_job_params = ActionController::Parameters.new(job_params).permit(
        :company, :location, :industry, :start_year, :years_at_job
      )
      Rails.logger.debug "Permitted Job Params: #{permitted_job_params.inspect}"
  
      # Create the CareerJob object
      career_job = CareerJob.new(permitted_job_params)
      career_job.user = current_user # Assign the user
      Rails.logger.debug "Assigned User: #{current_user.inspect}"
  
      # Create the associated CareerCompensations
      if compensation_params.present?
        compensation_params.values.each do |compensation|
          permitted_compensation = ActionController::Parameters.new(compensation).permit(
            :group, :level, :sub_level, :salary, :bonus, :hours_worked_per_week, :year
          )
          Rails.logger.debug "Permitted Compensation: #{permitted_compensation.inspect}"
  
          career_job.career_compensations.build(permitted_compensation)
        end
      end
  
      Rails.logger.debug "Built CareerJob: #{career_job.inspect}"
      Rails.logger.debug "CareerJob Compensations: #{career_job.career_compensations.map(&:inspect)}"
  
      career_job
    end
  
    # Save all jobs
    if @career_jobs.all?(&:save)
      Rails.logger.debug "All CareerJobs saved successfully!"
      redirect_to admin_career_jobs_path, notice: 'Career jobs created successfully.'
    else
      redirect_to admin_career_jobs_path, alert: 'Some fields are missing or invalid. Please correct them.'
    end
  end
  
  
  
  

  def edit; end

  def update
    if @career_job.update(career_job_params)
      redirect_to admin_career_jobs_path, notice: "Career job updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @career_job.destroy
      redirect_to admin_career_jobs_path, notice: "Career job deleted successfully."
    else
      redirect_to admin_career_jobs_path, alert: "Failed to delete career job."
    end
  end

  private

  def set_career_job
    @career_job = CareerJob.find(params[:id])
  end

  def set_dropdown_values
    @companies = Company.all.order(:name)
    @locations = Location.all.order(:name)
    @groups = Group.all.order(:name)
    @industries = PositionType.distinct.pluck(:name)
  end

  
end
