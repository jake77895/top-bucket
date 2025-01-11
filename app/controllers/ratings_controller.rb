class RatingsController < ApplicationController
  before_action :set_employee_view_and_employee, only: [:select_context, :new, :create]

  # Step 1: Select form context (Networking or Interview)
  def select_context
    # Renders a view to select the interaction context
  end

  # Step 2: Display questions based on selected context
  def new
    @form_context = params[:form_context]
    @employee = Employee.find(params[:employee_id])
    @employee_view = EmployeeView.find(params[:employee_view_id]) # Ensure this is included
  
    # Redirect if no form context is provided
    if @form_context.blank?
      redirect_to select_context_employee_view_employee_rating_path(@employee_view, @employee), alert: 'Please select a context.' and return
    end
  
    # Check if a rating already exists for this user, employee, and context
    existing_rating = Rating.find_by(user: current_user, employee: @employee, form_context: @form_context)
    
    if existing_rating
      redirect_to employee_view_path(@employee_view), alert: "You have already submitted a rating for #{@form_context.capitalize}." and return
    end
  
    # Load form questions and initialize a new rating
    @form_questions = FormTemplate.where(position_type_id: @employee.position_type_id, form_context: @form_context).order(:position)
    @rating = Rating.new
  end

  # Step 3: Handle form submission
  def create
    @form_context = params[:form_context]
    @form_questions = FormTemplate.where(position_type_id: @employee.position_type_id, form_context: @form_context).order(:position)
    @employee_view = EmployeeView.find(params[:employee_view_id])
    @employee = Employee.find(params[:employee_id])
    @rating = @employee.ratings.build(rating_params.merge(user_id: current_user.id))

    if @rating.save
      redirect_to employee_view_path(@employee_view), notice: 'Rating submitted successfully.'
    else
      # Display validation error
      flash[:alert] = @rating.errors.full_messages.to_sentence
      redirect_to employee_view_path(@employee_view)
    end
  end

  private

  def set_employee_view_and_employee
    @employee_view = EmployeeView.find(params[:employee_view_id])
    @employee = Employee.find(params[:employee_id])
  end

  def rating_params
    params.require(:rating).permit(:form_context, :comment, :user_id, responses: {})
  end
  
end
