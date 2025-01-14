class QuestionsUsersController < ApplicationController
  before_action :authenticate_user!

  def toggle_star
    @question = Question.find(params[:question_id])

    # Find all questions in the same linked group
    linked_questions = if @question.question_link.present?
                         Question.where(question_link: @question.question_link)
                       else
                         [@question]
                       end

    # Check if any of the linked questions are already starred
    questions_user = QuestionsUser.where(question: linked_questions, user: current_user)

    if questions_user.exists?
      # Unstar all linked questions
      questions_user.destroy_all
      # flash[:notice] = "Questions unstarred successfully."
    else
      # Star all linked questions
      linked_questions.each do |question|
        QuestionsUser.find_or_create_by(question: question, user: current_user)
      end
      # flash[:notice] = "Questions starred successfully."
    end

    # Redirect back to the referring page
    redirect_back fallback_location: root_path
  end
end

