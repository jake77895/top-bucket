class Admin::QuestionPacketsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_question_packet, only: [:edit, :update, :destroy, :manage, :update_questions]

  def index
    @question_packets = QuestionPacket.all.order(:name) # Sort packets alphabetically
  end

  def new
    @question_packet = QuestionPacket.new
  end

  def create
    @question_packet = QuestionPacket.new(question_packet_params)
    if @question_packet.save
      redirect_to admin_question_packets_path, notice: "Question Packet created successfully."
    else
      render :new, alert: "Failed to create Question Packet."
    end
  end

  def edit
  end

  def update
    if @question_packet.update(question_packet_params)
      redirect_to admin_question_packets_path, notice: "Question Packet updated successfully."
    else
      render :edit, alert: "Failed to update Question Packet."
    end
  end

  def destroy
    @question_packet.destroy
    redirect_to admin_question_packets_path, notice: "Question Packet deleted successfully."
  end

  def manage
    @questions = Question.all.order(:question_text) # Fetch all questions
  end

  def update_questions
    if @question_packet.update(question_ids: params[:question_ids])
      redirect_to admin_question_packets_path, notice: 'Questions updated successfully.'
    else
      redirect_to manage_admin_question_packet_path(@question_packet), alert: 'Failed to update questions.'
    end
  end

  private

  def set_question_packet
    @question_packet = QuestionPacket.find(params[:id])
  end

  def question_packet_params
    params.require(:question_packet).permit(:name)
  end
end
