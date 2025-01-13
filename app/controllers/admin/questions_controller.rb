class Admin::QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_question, only: [:edit, :update, :destroy]

  def index
    @questions = Question.all.order(:id) # You can customize ordering or pagination here
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to admin_questions_path, notice: "Question created successfully."
    else
      render :new, alert: "Failed to create question."
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to admin_questions_path, notice: "Question updated successfully."
    else
      render :edit, alert: "Failed to update question."
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_questions_path, notice: "Question deleted successfully."
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(
      :question_text, :answer_choice_1, :answer_choice_2, :answer_choice_3, :answer_choice_4,
      :correct_answer, :explanation_text, :technical, :behavior, :category,
      :position_type_id, :difficulty_level, :related_organization, :question_link, :question_link_order
    )
  end
end
