class Admin::CareerAggregateJobsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_career_aggregate_job, only: [:edit, :update, :destroy]

  def index
    @career_aggregate_jobs = CareerAggregateJob.order(created_at: :desc)
  end

  def new
    @career_aggregate_job = CareerAggregateJob.new
  
    # Fetch positions (if they are distinct within PositionType)
    @positions = PositionType.distinct.pluck(:name) 
  
    # Fetch companies
    @companies = Company.order(:name)
  
    # Fetch industries (if industries are also in PositionType)
    @industries = PositionType.distinct.order(:name)
  
    # Fetch job levels
    @job_levels = JobLevel.order(:name)
  
    # Fetch groups
    @groups = Group.order(:name) # Assuming you have a `Group` model for groups
  
    # Fetch locations
    @locations = Location.order(:name) # Assuming you have a `Location` model
  end
  

  def create
    @career_aggregate_job = CareerAggregateJob.new(career_aggregate_job_params)

    if @career_aggregate_job.save
      redirect_to admin_career_aggregate_jobs_path, notice: 'Career aggregate job was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @career_aggregate_job = CareerAggregateJob.find(params[:id])
  
    # Fetch supporting data
    @positions = PositionType.distinct.pluck(:name)
    @companies = Company.order(:name)
    @industries = PositionType.distinct.order(:name)
    @job_levels = JobLevel.order(:name)
    @groups = Group.order(:name)
    @locations = Location.order(:name)
  end
  

  def update
    @career_aggregate_job = CareerAggregateJob.find(params[:id])
    
    if @career_aggregate_job.update(career_aggregate_job_params)
      redirect_to admin_career_aggregate_jobs_path, notice: 'Career aggregate job updated successfully.'
    else
      set_dropdown_data # Call a method to repopulate form dropdowns
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @career_aggregate_job.destroy
      redirect_to admin_career_aggregate_jobs_path, notice: 'Career aggregate job was successfully deleted.'
    else
      redirect_to admin_career_aggregate_jobs_path, alert: 'Failed to delete career aggregate job.'
    end
  end

  private

  def set_career_aggregate_job
    @career_aggregate_job = CareerAggregateJob.find(params[:id])
  end

  def career_aggregate_job_params
    params.require(:career_aggregate_job).permit(:company, :industry, :group, :level, :sub_level, 
                                                 :average_salary, :average_bonus, 
                                                 :average_hours_worked_per_week, 
                                                 :sample_size, :year, :location)
  end


end
