class Admin::CareerCompensationsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  before_action :set_career_job
  before_action :set_career_compensation, only: [:edit, :update, :destroy]

  def new
    @career_compensation = @career_job.career_compensations.build
  end

  def create
    @career_compensation = @career_job.career_compensations.build(career_compensation_params)
    if @career_compensation.save
      redirect_to admin_career_job_path(@career_job), notice: "Compensation created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @career_compensation.update(career_compensation_params)
      redirect_to admin_career_job_path(@career_job), notice: "Compensation updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @career_compensation.destroy
      redirect_to admin_career_job_path(@career_job), notice: "Compensation deleted successfully."
    else
      redirect_to admin_career_job_path(@career_job), alert: "Failed to delete compensation."
    end
  end

  private

  def set_career_job
    @career_job = CareerJob.find(params[:career_job_id])
  end

  def set_career_compensation
    @career_compensation = @career_job.career_compensations.find(params[:id])
  end

  def career_compensation_params
    params.require(:career_compensation).permit(:year, :level, :sub_level, :salary, :bonus, :hours_worked_per_week)
  end

  def require_admin
    redirect_to root_path, alert: "You are not authorized to access this page." unless current_user.admin?
  end
end
