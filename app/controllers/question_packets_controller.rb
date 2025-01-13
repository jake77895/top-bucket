class QuestionPacketsController < ApplicationController
  def index
    @question_packets = QuestionPacket.all.order(:name) # Order alphabetically
  end

  def show
    @question_packet = QuestionPacket.find(params[:id])
    @questions = @question_packet.questions.order(:id)
    @current_question_index = params[:question_index].to_i || 0
    @question = @questions[@current_question_index]

    # Determine navigation indices
    @prev_index = @current_question_index.positive? ? @current_question_index - 1 : nil
    @next_index = @current_question_index < @questions.size - 1 ? @current_question_index + 1 : nil
  end
end
