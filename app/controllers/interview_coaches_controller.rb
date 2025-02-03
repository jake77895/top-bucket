class InterviewCoachesController < ApplicationController
  before_action :set_interview_coach, only: [:edit, :update]
  before_action :require_interview_coach_role, only: [:new, :create, :edit, :update]

  def index
    @interview_coaches = InterviewCoach.includes(:user).order(:name)
    # Ensure @interview_coach is set for the current user.
    if current_user
      @interview_coach = current_user.interview_coach || current_user.build_interview_coach
    end
  end

  def new
    # Redirect to edit page if the current user already has a profile.
    if current_user.interview_coach.present?
      redirect_to edit_interview_coach_path(current_user.interview_coach), notice: "You already have a profile. Please update it."
    else
      @interview_coach = InterviewCoach.new
    end
  end

  def create
    if current_user.interview_coach.present?
      redirect_to edit_interview_coach_path(current_user.interview_coach), alert: "You already have a profile."
    else
      @interview_coach = current_user.build_interview_coach(interview_coach_params)
      if @interview_coach.save
        redirect_to interview_coaches_path, notice: "Profile created successfully."
      else
        render :new
      end
    end
  end

  def edit
    # Ensure only the owner can edit their profile
    redirect_to interview_coaches_path, alert: "Not authorized" unless current_user == @interview_coach.user
  end

  def update
    if @interview_coach.update(interview_coach_params)
      redirect_to interview_coaches_path, notice: "Profile updated successfully."
    else
      render :edit
    end
  end

  private

  def set_interview_coach
    @interview_coach = InterviewCoach.find(params[:id])
  end

  def interview_coach_params
    params.require(:interview_coach).permit(
      :name, 
      :linkedin_url, 
      :industry, 
      :description, 
      :languages, 
      :other_industries, # Updated column name
      :highlighted_job,
      :picture
    )
  end

  def require_interview_coach_role
    unless current_user&.is_interview_coach?
      redirect_to interview_coaches_path, alert: "You are not authorized to manage an interview coach profile."
    end
  end
end
