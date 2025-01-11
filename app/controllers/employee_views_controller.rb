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

    # Variables for the form and rating components
    @form_context = params[:form_context] || 'coffee_chat' # Default form context
    @form_questions = @employee ? load_form_questions(@form_context) : []
    @ratings = @employee ? load_ratings(@form_context) : []
    @rating = Rating.new # Initialize a new rating for the form

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

  def set_employee
    @employee = Employee.find(params[:id]) # Find the employee based on the ID
  end

  # Fetches the form questions based on the employee's position type and the form context
  def load_form_questions(form_context)
    FormTemplate.where(
      position_type_id: @employee.position_type_id,
      form_context: form_context
    )
  end

  # Fetches ratings for the employee filtered by the form context
  def load_ratings(form_context)
    @employee.ratings.includes(:user).where(form_context: form_context)
  end


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
