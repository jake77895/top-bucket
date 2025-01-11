class RatingsController < ApplicationController
  def new
    @employee_view = EmployeeView.find(params[:employee_view_id])
    @employee = Employee.find(params[:employee_id])
    @form_context = params[:form_context]
    @form_questions = FormTemplate.where(position_type_id: @employee.position_type_id, form_context: @form_context)
    @rating = Rating.new
  end

  def create
    @employee_view = EmployeeView.find(params[:employee_view_id])
    @employee = Employee.find(params[:employee_id])
    @rating = @employee.ratings.build(rating_params.merge(user_id: current_user.id))

    if @rating.save
      redirect_to employee_view_path(@employee), notice: 'Rating submitted successfully.'
    else
      redirect_to employee_view_path(@employee), alert: 'There was an error submitting your rating.'
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:form_context, :comment, responses: {})
  end
end
