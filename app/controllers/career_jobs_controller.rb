class CareerJobsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_career_job, only: [:destroy]
  before_action :set_dropdown_values, only: [:step_one]

  def index
    @career_jobs = current_user.career_jobs.includes(:career_compensations).order(created_at: :desc)
  end

  def step_one
    @companies = Company.all.order(:name)
    @locations = Location.all.order(:name)
    @industries = PositionType.all.order(:name)
  end

  def save_step_one
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

    redirect_to step_two_career_jobs_path
  end

  def step_two
    unless session[:jobs].present?
      redirect_to step_one_career_jobs_path, alert: "Please complete Step 1 first."
      return
    end

    @career_jobs = session[:jobs].map do |job|
      next if job["company"].blank? || job["location"].blank? || job["industry"].blank?

      company = Company.find_by(name: job["company"])
      location = Location.find_by(name: job["location"])
      position_type = PositionType.find_by(name: job["industry"])

      next unless company && location && position_type

      CareerJob.new(
        company: job["company"],
        location: job["location"],
        industry: job["industry"],
        years_at_job: job["years_at_job"],
        start_year: job["start_year"],
        previous_undergrad: job["previous_undergrad"],
        previous_mba: job["previous_mba"],
        previous_grad: job["previous_grad"]
      )
    end.compact
  end

  def create
    job_grouping = Time.current.to_i
    @career_jobs = params.require(:career_jobs).to_unsafe_h.values.map.with_index(1) do |job_params, index|
      compensation_params = job_params.delete("career_compensations")

      permitted_job_params = ActionController::Parameters.new(job_params).permit(
        :company, :location, :industry, :start_year, :years_at_job,
        :previous_undergrad, :previous_mba, :previous_grad
      )

      career_job = CareerJob.new(permitted_job_params)
      career_job.user = current_user
      career_job.job_grouping = job_grouping
      career_job.job_order = index

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

    if @career_jobs.all?(&:save)
      redirect_to career_jobs_path, notice: 'Career jobs created successfully.'
    else
      redirect_to career_jobs_path, alert: 'Some fields are missing or invalid. Please correct them.'
    end
  end

  def destroy
    if @career_job.destroy
      redirect_to career_jobs_path, notice: "Career job deleted successfully."
    else
      redirect_to career_jobs_path, alert: "Failed to delete career job."
    end
  end

  private

  def set_career_job
    @career_job = current_user.career_jobs.find(params[:id])
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
