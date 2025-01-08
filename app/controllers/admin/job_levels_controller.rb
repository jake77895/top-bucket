class Admin::JobLevelsController < ApplicationController
  before_action :authorize_admin!
  before_action :set_job_level, only: [:destroy]

  ## =====================
  ## INDEX VIEW
  ## =====================

  def index
    @job_levels = JobLevel
                    .left_joins(:company, :position_type)
                    .includes(:company, :position_type)
                    .order(
                      Arel.sql('COALESCE(companies.name, \'zzz\')'), 
                      Arel.sql('COALESCE(position_types.name, \'zzz\')'), 
                      :level_rank
                    )
  end
  
  

  ## =====================
  ## NEW ACTIONS
  ## =====================

  # New Company-Specific Job Level
  def new_company
    @job_level = JobLevel.new
    @companies = Company.all
    @position_types = PositionType.all.order(:name)
    render 'new_company'
  end

  # New Position Type Job Level
  def new_position_type
    @job_level = JobLevel.new
    @position_types = PositionType.all
    render 'new_position_type'
  end

  # New Global Default Job Level
  def new_global
    @job_level = JobLevel.new
    render 'new_global'
  end

  ## =====================
  ## CREATE
  ## =====================

  def create
    company_id = params[:job_level][:company_id]
    position_type_id = params[:job_level][:position_type_id]
    is_position_type_default = params[:job_level][:is_position_type_default] == '1'
    is_global_default = params[:job_level][:is_global_default] == '1'
    job_levels = params[:job_levels]

    if job_levels.present?
      job_levels.each do |job_level|
        JobLevel.create(
          name: job_level[:name],
          level_rank: job_level[:level_rank],
          company_id: company_id,
          position_type_id: position_type_id,
          is_position_type_default: is_position_type_default,
          is_global_default: is_global_default
        )
      end
      redirect_to admin_job_levels_path, notice: 'Job Levels created successfully.'
    else
      flash[:alert] = 'Please ensure all fields are properly filled out.'
      handle_render_for_form_type
    end
  end

  ## =====================
  ## UPDATE
  ## =====================

  def update
    if @job_level.update(job_level_params)
      redirect_to admin_job_levels_path, notice: 'Job Level updated successfully.'
    else
      handle_render_for_form_type
    end
  end

  ## =====================
  ## DELETE
  ## =====================

  def destroy
    @job_level.destroy
    redirect_to admin_job_levels_path, alert: 'Job Level deleted successfully.'
  end

  private

  ## =====================
  ## SETTERS & PERMITTED PARAMS
  ## =====================

  def set_job_level
    @job_level = JobLevel.find(params[:id])
  end

  def job_level_params
    params.require(:job_level).permit(
      :name, 
      :level_rank, 
      :company_id, 
      :position_type_id, 
      :is_global_default, 
      :is_position_type_default
    )
  end

  def handle_render_for_form_type
    if params[:job_level][:company_id].present?
      @companies = Company.all
      render 'new_company'
    elsif params[:job_level][:position_type_id].present?
      @position_types = PositionType.all
      render 'new_position_type'
    else
      render 'new_global'
    end
  end
end
