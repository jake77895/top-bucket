class Admin::EmployeeViewsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_employee_view, only: [:show, :edit, :update, :destroy, :manage_employees, :add_employee, :remove_employee]

  # GET /admin/employee_views
  def index
    @employee_views = EmployeeView.all.order(created_at: :desc)
  end

  # GET /admin/employee_views/:id
  def show; end

  # GET /admin/employee_views/new
  def new
    @employee_view = EmployeeView.new
  end

  # POST /admin/employee_views
  def create
    @employee_view = EmployeeView.new(employee_view_params)

    if @employee_view.save
      redirect_to admin_employee_views_path, notice: 'Employee view was successfully created.'
    else
      flash.now[:alert] = 'There was an error creating the employee view.'
      render :new
    end
  end

  # GET /admin/employee_views/:id/edit
  def edit; end

  # PATCH/PUT /admin/employee_views/:id
  def update
    if @employee_view.update(employee_view_params)
      @employee_view.picture.purge if params[:employee_view][:remove_picture] == '1' # Purge if checkbox is checked
      redirect_to admin_employee_views_path, notice: 'Employee view was successfully updated.'
    else
      flash.now[:alert] = 'There was an error updating the employee view.'
      render :edit
    end
  end
  

  # DELETE /admin/employee_views/:id
  def destroy
    @employee_view.destroy
    redirect_to admin_employee_views_path, notice: 'Employee view was successfully deleted.'
  end

  # Adds and removes employees from the employee view

   # GET /admin/employee_views/:id/manage_employees
   def manage_employees
    @employees = Employee.includes(:company, :job_level, :group, :location).all
    @associated_employees = @employee_view.employees.includes(:company, :job_level, :group, :location)
  end

  # POST /admin/employee_views/:id/add_employee
  def add_employee
    employee = Employee.find(params[:employee_id])
    if @employee_view.employees << employee
      redirect_to manage_employees_admin_employee_view_path(@employee_view), notice: "#{employee.name} successfully added."
    else
      redirect_to manage_employees_admin_employee_view_path(@employee_view), alert: "Failed to add employee."
    end
  end

  # DELETE /admin/employee_views/:id/remove_employee
  def remove_employee
    employee = Employee.find(params[:employee_id])
    if @employee_view.employees.delete(employee)
      redirect_to manage_employees_admin_employee_view_path(@employee_view), notice: "#{employee.name} successfully removed."
    else
      redirect_to manage_employees_admin_employee_view_path(@employee_view), alert: "Failed to remove employee."
    end
  end

  private

  # Set Employee View
  def set_employee_view
    @employee_view = EmployeeView.find(params[:id])
  end

  # Strong Parameters
  def employee_view_params
    params.require(:employee_view).permit(:name, :description, :picture, :remove_picture)
  end
  
end
