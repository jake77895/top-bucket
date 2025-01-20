class MockInterviewProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_profile, only: [:edit, :update]

  def new
    @mock_interview_profile = current_user.build_mock_interview_profile
  end

  def create
    @mock_interview_profile = current_user.build_mock_interview_profile(mock_interview_profile_params)
    if @mock_interview_profile.save
      redirect_to meeting_board_mock_interviews_path, notice: "Mock Interview Profile created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @mock_interview_profile = current_user.mock_interview_profile
  end

  def update
    @mock_interview_profile = current_user.mock_interview_profile
    if @mock_interview_profile.update(mock_interview_profile_params)
      redirect_to mock_interviews_path, notice: "Mock Interview Profile updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def mock_interview_profile_params
    params.require(:mock_interview_profile).permit(:first_name, :recruiting_for, :technical_prep_level, :organization, :linkedin_url, :preferred_language, :english_proficiency, :time_zone)
  end

  def authorize_profile
    redirect_to root_path, alert: "Access denied." unless current_user.mock_interview_profile
  end
end
