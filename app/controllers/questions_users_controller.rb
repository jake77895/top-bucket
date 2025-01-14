class QuestionsUsersController < ApplicationController
  before_action :authenticate_user!

  def toggle_star

    @question = Question.find(params[:question_id])
    questions_user = QuestionsUser.find_or_initialize_by(question: @question, user: current_user)

    if questions_user.persisted?
      questions_user.destroy
      # flash[:notice] = "Question unstarred successfully."
    else
      if questions_user.save
        # flash[:notice] = "Question starred successfully."
      else
        flash[:alert] = "Unable to star the question. Please try again."
      end
    end

    # Redirect back to the referring page
    redirect_back fallback_location: root_path
  end
end
