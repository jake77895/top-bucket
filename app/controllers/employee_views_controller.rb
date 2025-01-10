class EmployeeViewsController < ApplicationController
  def show
    @employee_view = EmployeeView.find(params[:id])
    @associated_pages = @employee_view.pages

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

