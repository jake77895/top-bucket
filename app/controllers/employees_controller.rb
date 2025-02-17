class EmployeesController < ApplicationController
  before_action :authenticate_user!

  def new
    @employee = Employee.new
    @companies = Company.select('DISTINCT ON (name) *').order(:name, :id)
    @position_types = PositionType.all
    @locations = Location.all
  end

  def create_initial
    @employee = Employee.new(initial_employee_params)

    if @employee.valid?
      session[:employee_initial] = initial_employee_params
      redirect_to new_details_employees_path, notice: 'Initial details saved. Please complete the remaining information.'
    else
      @companies = Company.select('DISTINCT ON (name) *').order(:name, :id)
      @position_types = PositionType.all
      flash.now[:alert] = 'Please fill in all required fields.'
      render :new
    end
  end

  def new_details
    if session[:employee_initial].blank?
      redirect_to new_employee_path, alert: 'Please provide initial details first.'
      return
    end

    @employee = Employee.new(session[:employee_initial])
    @groups = fetch_groups(@employee.company_id, @employee.location_id, @employee.position_type_id)
    @job_levels = fetch_job_levels(@employee.company_id, @employee.position_type_id)
    @locations = Location.all
    @schools = School.all
    @companies = Company.select('DISTINCT ON (name) *').order(:name, :id)
  end

  def create
    @employee = Employee.new(session[:employee_initial].merge(employee_params))
    @employee.flagged = 1 # Set flag to 1 instead of true
    @employee.flag_comment = "Added by user. Needs Review"

    if @employee.save
      # Create a flag record for this employee
      Flag.create!(
        flaggable: @employee,
        reason: "User Submission",
        text: "New professional added by user. Needs review.",
        status: "pending",
        user_id: current_user.id
      )
      
      # If position type is Investment Banking, associate with the IB employee view
      if @employee.position_type.name == "Investment Banking"
        if ib_view = EmployeeView.find_by(name: "Investment Banking")
          EmployeeViewsEmployee.create(
            employee_view: ib_view,
            employee: @employee
          )
        end
      end
      
      session.delete(:employee_initial)
      redirect_to root_path, notice: 'Thank you for your submission. It will be reviewed by our team.'
    else
      @groups = fetch_groups(@employee.company_id, @employee.position_type_id)
      @job_levels = fetch_job_levels(@employee.company_id, @employee.position_type_id)
      @locations = Location.all
      @schools = School.all
      flash.now[:alert] = 'Failed to save employee details.'
      render :new_details
    end
  end

  private

  def initial_employee_params
    params.require(:employee).permit(:name, :company_id, :position_type_id, :location_id)
  end

  def employee_params
    params.require(:employee).permit(
      :job_level_id, :previous_company_id, :linkedin_url,
      :group_id, :location_id, :undergraduate_school_id, :graduate_school_id, :picture
    )
  end

  # Reuse the same fetch methods from admin controller
  def fetch_groups(company_id, location_id, position_type_id)
    if Group.where(company_id: company_id, location_id: location_id).exists?
      Group.where(company_id: company_id, location_id: location_id)
    elsif Group.where(company_id: company_id).exists?
      Group.where(company_id: company_id)
    elsif Group.where(position_type_id: position_type_id, position_type_default: true).exists?
      Group.where(position_type_id: position_type_id, position_type_default: true)
    else
      []
    end
  end

  def fetch_job_levels(company_id, position_type_id)
    if JobLevel.where(company_id: company_id).exists?
      JobLevel.where(company_id: company_id).order(:level_rank)
    elsif JobLevel.where(position_type_id: position_type_id, is_position_type_default: true).exists?
      JobLevel.where(position_type_id: position_type_id, is_position_type_default: true).order(:level_rank)
    else
      JobLevel.where(is_global_default: true).order(:level_rank)
    end
  end
end 
