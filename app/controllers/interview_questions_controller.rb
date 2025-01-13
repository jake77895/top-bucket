class InterviewQuestionsController < ApplicationController
  def index
    # Placeholder data for now; replace with dynamic data later
    @question_packets = [
      { id: 1, title: 'Packet 1: Basic Banking Questions', description: 'A collection of beginner-level questions covering fundamental topics.' },
      { id: 2, title: 'Packet 2: Advanced Concepts', description: 'Dive deep into advanced concepts with these challenging questions.' },
      { id: 3, title: 'Packet 3: Behavioral Questions', description: 'Prepare for the personal side of interviews with behavioral questions.' }
    ]
  end

  def show
    # Placeholder data for now; replace with dynamic data later
    @packet = { id: params[:id], title: "Packet #{params[:id]}: Example Packet", questions: ['Question 1', 'Question 2', 'Question 3'] }
  end
end
