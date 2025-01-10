class EmployeeViewsController < ApplicationController
  def show
    @employee_view = EmployeeView.find(params[:id])
    @associated_pages = @employee_view.pages

    # Perform filtering
    filter

    # Fetches the job levels linked to employees in the employee_view, ordered by level_rank descending
    @job_levels = JobLevel
                  .joins(:employees)
                  .where(employees: { id: @employee_view.employee_ids })
                  .distinct
                  .order(level_rank: :desc)

    # Fetch employees under "Other" category (without job levels)
    @other_employees = @employee_view.employees.where(job_level_id: nil)
  end
end

def filter
  # Ensure only permitted parameters are used
  permitted_q = permitted_filter_params

  @q = @employee_view.employees.ransack(permitted_q)
  @filtered_employees = @q.result(distinct: true)

  @job_levels = JobLevel.where(id: @filtered_employees.pluck(:job_level_id).uniq).order(level_rank: :desc)
  @groups = Group.where(id: @filtered_employees.pluck(:group_id).uniq).order(:name)
  @locations = Location.where(id: @filtered_employees.pluck(:location_id).uniq).order(:name)
  @companies = Company.where(id: @filtered_employees.pluck(:company_id).uniq).order(:name)
  @previous_companies = Company.where(id: @filtered_employees.pluck(:previous_company_id).uniq).order(:name)
  @undergraduate_schools = School.where(id: @filtered_employees.pluck(:undergraduate_school_id).uniq).order(:name)
  @graduate_schools = School.where(id: @filtered_employees.pluck(:graduate_school_id).uniq).order(:name)
end

private

def permitted_filter_params
  # Safely permit only allowed `q` parameters
  params.fetch(:q, {}).permit(
    :job_level_id_eq,
    :group_id_eq,
    :location_id_eq,
    :company_id_eq,
    :previous_company_id_eq,
    :undergraduate_school_id_eq,
    :graduate_school_id_eq
  )
end
