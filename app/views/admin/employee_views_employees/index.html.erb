class Admin::EmployeeViewsEmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  # GET /admin/employee_views_employees
  def index
    @employee_views_employees = EmployeeViewsEmployee.includes(:employee, :employee_view)
  end

  # GET /admin/employee_views_employees/new
  def new
    @employee_views_employee = EmployeeViewsEmployee.new
    @employees = Employee.all
    @employee_views = EmployeeView.all
  end

  # POST /admin/employee_views_employees
  def create
    @employee_views_employee = EmployeeViewsEmployee.new(employee_views_employee_params)

    if @employee_views_employee.save
      redirect_to admin_employee_views_employees_path, notice: 'Employee successfully added to Employee View.'
    else
      @employees = Employee.all
      @employee_views = EmployeeView.all
      flash.now[:alert] = 'Failed to add Employee to Employee View.'
      render :new
    end
  end

  # DELETE /admin/employee_views_employees/:id
  def destroy
    @employee_views_employee = EmployeeViewsEmployee.find(params[:id])
    @employee_views_employee.destroy
    redirect_to admin_employee_views_employees_path, notice: 'Association successfully deleted.'
  end

  private

  # Strong Parameters
  def employee_views_employee_params
    params.require(:employee_views_employee).permit(:employee_id, :employee_view_id)
  end
end
