class Admin::EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_employee, only: [:edit_initial, :edit_details, :update_initial, :destroy]

  ## =====================
  ## INDEX ACTION
  ## =====================
  # GET /admin/employees
  def index
    @employees = Employee.includes(:job_level, :company, :group, :location, :undergraduate_school, :graduate_school)
                         .order(created_at: :desc)
  end

  ## =====================
  ## INITIAL CREATION FLOW (Step 1)
  ## =====================
  # GET /admin/employees/new
  def new
    @employee = Employee.new
    @companies = Company.select('DISTINCT ON (name) *').order(:name, :id)
    @position_types = PositionType.all
    @locations = Location.all
  end


  # POST /admin/employees/create_initial
  def create_initial
    @employee = Employee.new(initial_employee_params)

    if @employee.valid?
      session[:employee_initial] = initial_employee_params
      redirect_to new_details_admin_employees_path, notice: 'Initial details saved. Proceed to finalize the employee information.'
    else
      @companies = Company.select('DISTINCT ON (name) *').order(:name, :id)
      @position_types = PositionType.all
      flash.now[:alert] = 'Please fill in all required fields.'
      render :new
    end
  end

  ## =====================
  ## DETAILS CREATION FLOW (Step 2)
  ## =====================
  # GET /admin/employees/new_details
  def new_details
    if session[:employee_initial].blank?
      redirect_to new_admin_employee_path, alert: 'Please provide initial details first.'
      return
    end

    @employee = Employee.new(session[:employee_initial])
    @groups = fetch_groups(@employee.company_id, @employee.location_id, @employee.position_type_id)
    @job_levels = fetch_job_levels(@employee.company_id, @employee.position_type_id)
    @locations = Location.all
    @schools = School.all
    @companies = Company.select('DISTINCT ON (name) *').order(:name, :id)
  end


  # POST /admin/employees
  def create
    @employee = Employee.new(session[:employee_initial].merge(employee_params))

    if @employee.save
      session.delete(:employee_initial)
      redirect_to admin_employees_path, notice: 'Employee was successfully created.'
    else
      @groups = fetch_groups(@employee.company_id, @employee.position_type_id)
      @job_levels = fetch_job_levels(@employee.company_id, @employee.position_type_id)
      @locations = Location.all
      @schools = School.all
      flash.now[:alert] = 'Failed to save employee details.'
      render :new_details, status: :unprocessable_entity
    end
  end

  ## =====================
  ## EDIT ACTION - Step 1
  ## =====================
  # GET /admin/employees/:id/edit_initial
  def edit_initial
    @employee = Employee.find(params[:id])
    @companies = Company.select('DISTINCT ON (name) *').order(:name, :id)
    @position_types = PositionType.all
    @locations = Location.all
  end

  # PATCH /admin/employees/:id/update_initial
  def update_initial
    @employee = Employee.find(params[:id])

    if @employee.update(initial_employee_params)
      session[:employee_edit] = initial_employee_params
      redirect_to edit_details_admin_employee_path(@employee), notice: 'Initial details updated. Proceed to finalize the employee information.'
    else
      @companies = Company.select('DISTINCT ON (name) *').order(:name, :id)
      @position_types = PositionType.all
      @locations = Location.all
      flash.now[:alert] = 'Please fill in all required fields.'
      render :edit_initial
    end
  end

  ## =====================
  ## EDIT ACTION - Step 2
  ## =====================
  # GET /admin/employees/:id/edit_details
  def edit_details
    @employee = Employee.find(params[:id])
  
    if session[:employee_edit].blank?
      redirect_to edit_initial_admin_employee_path(@employee), alert: 'Please provide initial details first.'
      return
    end
  
    @groups = fetch_groups(@employee.company_id, @employee.location_id, @employee.position_type_id)
    @job_levels = fetch_job_levels(@employee.company_id, @employee.position_type_id)
    @locations = Location.all
    @schools = School.all
    @companies = Company.select('DISTINCT ON (name) *').order(:name, :id)
  end

  # PATCH /admin/employees/:id
  def update
    @employee = Employee.find(params[:id])

    # Remove the picture if the checkbox is checked
    @employee.picture.purge if params[:employee][:remove_picture] == '1'

    if @employee.update(session[:employee_edit].merge(employee_params))
      session.delete(:employee_edit)
      redirect_to admin_employees_path, notice: 'Employee was successfully updated.'
    else
      @groups = fetch_groups(@employee.company_id, @employee.location_id, @employee.position_type_id)
      @job_levels = fetch_job_levels(@employee.company_id, @employee.position_type_id)
      @locations = Location.all
      @schools = School.all
      flash.now[:alert] = 'Failed to save employee details.'
      render :edit_details, status: :unprocessable_entity
    end
  end

  ## =====================
  ## DELETE ACTION
  ## =====================
  # DELETE /admin/employees/:id
  def destroy
    @employee.destroy
    redirect_to admin_employees_path, notice: 'Employee was successfully deleted.'
  end

  ## =====================
  ## FLAG FLOW
  ## =====================

  def flagged
    @flagged_employees = Employee.joins(:flags)
                                 .where(flags: { status: "pending" })
                                 .distinct
                                 .select("employees.*, COUNT(flags.id) AS flag_count")
                                 .group("employees.id")
    @flags = Flag.where(status: "pending")
    render 'admin/flagged_employees/flagged'
  end

  def resolve
    employee = Employee.find(params[:id])
    flags = Flag.where(flaggable: employee, status: "pending")
    flags.update_all(status: "resolved")
    flash[:success] = "Flags for #{employee.name} have been resolved."
    redirect_to flagged_admin_employees_path

  end

  def destroy
    employee = Employee.find(params[:id])
    employee.destroy
    redirect_to flagged_admin_employees_path, notice: "Employee deleted successfully."
  end

  ## =====================
  ## PRIVATE METHODS
  ## =====================
  private

  # Set Employee
  def set_employee
    @employee = Employee.find(params[:id])
  end

  # Initial required params (Step 1)
  def initial_employee_params
    params.require(:employee).permit(:name, :company_id, :position_type_id, :location_id)
  end

  # Final params (Step 2)
  def employee_params
    params.require(:employee).permit(
      :job_level_id, :previous_company_id, :linkedin_url, :flagged, 
      :flag_comment, :group_id, :location_id, :undergraduate_school_id, :graduate_school_id, :picture, :remove_picture)
  end

  # Fetch Groups based on Company, Location, Position Type
  def fetch_groups(company_id, location_id, position_type_id)
    # Step 1: Check for groups matching company and location
    if Group.where(company_id: company_id, location_id: location_id).exists?
      Group.where(company_id: company_id, location_id: location_id)
    # Step 2: Check for groups matching only company
    elsif Group.where(company_id: company_id).exists?
      Group.where(company_id: company_id)
    # Step 3: Check for groups matching position type with default
    elsif Group.where(position_type_id: position_type_id, position_type_default: true).exists?
      Group.where(position_type_id: position_type_id, position_type_default: true)
    # Step 4: No matching groups
    else
      []
    end
  end


  # Fetch Job Levels based on Company/Position Type/Global Default
  def fetch_job_levels(company_id, position_type_id)
    if JobLevel.where(company_id: company_id).exists?
      JobLevel.where(company_id: company_id).order(:level_rank) # Order by level_rank
    elsif JobLevel.where(position_type_id: position_type_id, is_position_type_default: true).exists?
      JobLevel.where(position_type_id: position_type_id, is_position_type_default: true).order(:level_rank) # Order by level_rank
    else
      JobLevel.where(is_global_default: true).order(:level_rank) # Order by level_rank
    end
  end
  
end
