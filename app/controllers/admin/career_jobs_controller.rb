class Admin::CareerJobsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_career_job, only: [:destroy]
  before_action :set_dropdown_values, only: [:new, :step_one]

  def index
    @career_jobs = CareerJob.includes(:career_compensations).order(created_at: :desc)
  end

  def step_one
    # Dropdown values for step one
    @companies = Company.all.order(:name)
    @locations = Location.all.order(:name)
    @industries = PositionType.all.order(:name) # Assuming PositionType represents industries
  end

  def save_step_one
    # Permit and process parameters for step one
    session[:jobs] = params.require(:career_jobs).to_unsafe_h.values.map do |job|
      {
        company: Company.find_by(id: job["company_id"])&.name,
        location: Location.find_by(id: job["location_id"])&.name,
        industry: PositionType.find_by(id: job["industry_id"])&.name,
        years_at_job: job["years_at_job"],
        start_year: job["start_year"],
        previous_undergrad: job["previous_undergrad"],
        previous_mba: job["previous_mba"],
        previous_grad: job["previous_grad"]
      }
    end

    redirect_to step_two_admin_career_jobs_path
  end

  def step_two
    unless session[:jobs].present?
      redirect_to step_one_admin_career_jobs_path, alert: "Please complete Step 1 first."
      return
    end

    # Build CareerJob objects from session data
    @career_jobs = session[:jobs].map do |job|
      next if job["company"].blank? || job["location"].blank? || job["industry"].blank?

      # Find related records
      company = Company.find_by(name: job["company"])
      location = Location.find_by(name: job["location"])
      position_type = PositionType.find_by(name: job["industry"])

      # Skip invalid data
      next unless company && location && position_type

      # Fetch groups
      matching_groups = Group.where(
        company_id: company.id,
        location_id: location.id,
        position_type_id: position_type.id
      ).order(:name)

      # Fallback for groups
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

      # Fallback for job levels
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
        start_year: job["start_year"],
        previous_undergrad: job["previous_undergrad"],
        previous_mba: job["previous_mba"],
        previous_grad: job["previous_grad"]
      )

      # Attach dropdown data to CareerJob
      career_job.matching_groups = matching_groups
      career_job.matching_job_levels = matching_job_levels

      # Build compensations
      career_job.years_at_job.to_i.times { career_job.career_compensations.build }

      career_job
    end.compact
  end

  def create
    # Generate a unique job_grouping for this submission
    job_grouping = Time.current.to_i # Alternatively, use `SecureRandom.uuid` for more uniqueness
    
    @career_jobs = params.require(:career_jobs).to_unsafe_h.values.map.with_index(1) do |job_params, index|
      compensation_params = job_params.delete("career_compensations")
  
      # Permit job parameters
      permitted_job_params = ActionController::Parameters.new(job_params).permit(
        :company, :location, :industry, :start_year, :years_at_job,
        :previous_undergrad, :previous_mba, :previous_grad
      )
  
      # Build the CareerJob object
      career_job = CareerJob.new(permitted_job_params)
      career_job.user = current_user # Assign the user
      career_job.job_grouping = job_grouping # Assign the same grouping to all jobs in this submission
      career_job.job_order = index # Assign sequential order (1, 2, 3, ...)
  
      # Add compensations
      if compensation_params.present?
        compensation_params.values.each do |compensation|
          permitted_compensation = ActionController::Parameters.new(compensation).permit(
            :group, :level, :sub_level, :salary, :bonus, :hours_worked_per_week, :year
          )
          career_job.career_compensations.build(permitted_compensation)
        end
      end
  
      career_job
    end
  
    # Save all CareerJobs
    if @career_jobs.all?(&:save)
      redirect_to admin_career_jobs_path, notice: 'Career jobs created successfully.'
    else
      redirect_to admin_career_jobs_path, alert: 'Some fields are missing or invalid. Please correct them.'
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
    @industries = PositionType.all.order(:name)
    @groups = Group.all.order(:name)
    @undergrad_schools = School.where(undergraduate: true).order(:name)
    @mba_programs = School.where(mba: true).order(:name)
    @grad_schools = School.where(other_graduate: true).order(:name)
  end
end
