class QuestionsUsersController < ApplicationController
  before_action :authenticate_user!

  def toggle_star
    @question = Question.find(params[:question_id])
    questions_user = QuestionsUser.find_or_initialize_by(question: @question, user: current_user)

    if questions_user.persisted?
      questions_user.destroy
      render json: { status: "unstarred" }, status: :ok
    else
      questions_user.save
      render json: { status: "starred" }, status: :ok
    end
  end
end
