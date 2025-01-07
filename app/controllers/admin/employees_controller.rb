class Admin::EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_employee, only: [:edit, :update, :destroy]

  # GET /admin/employees
  def index
    @employees = Employee.includes(:job_level, :company, :group, :location, :school).order(created_at: :desc)
  end

  # GET /admin/employees/new
  def new
    @employee = Employee.new
    @employees = Employee.all.includes(:job_level) # Load all employees for the form
  end

  # POST /admin/employees
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to admin_employees_path, notice: 'Employee was successfully created.'
    else
      flash.now[:alert] = 'Failed to create employee.'
      render :new, status: :unprocessable_entity
    end
  end

  # GET /admin/employees/:id/edit
  def edit
    @employee = Employee.find(params[:id])
    @employees = Employee.all.includes(:job_level) # Ensure it's available
  end

  # PATCH/PUT /admin/employees/:id
  def update
    if @employee.update(employee_params)
      redirect_to admin_employees_path, notice: 'Employee was successfully updated.'
    else
      flash.now[:alert] = 'Failed to update employee.'
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /admin/employees/:id
  def destroy
    @employee.destroy
    redirect_to admin_employees_path, notice: 'Employee was successfully deleted.'
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(
      :name, :job_level_id, :company_id, :previous_company_id,
      :linkedin_url, :flagged, :flag_comment, :group_id,
      :location_id, :school_id
    )
  end
end
