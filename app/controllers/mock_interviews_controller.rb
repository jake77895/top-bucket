class MockInterviewsController < ApplicationController
  before_action :set_mock_interview, only: %i[accept complete destroy]
  require "icalendar"

  def calendar
    mock_interview = MockInterview.find(params[:id])

    calendar = Icalendar::Calendar.new
    calendar.event do |e|
      e.dtstart = mock_interview.check_date_time
      e.dtend = mock_interview.check_date_time + 1.hour
      e.summary = "Mock Interview"
      e.description = "Prepare for your mock interview!"
      e.location = "Online"
    end

    send_data calendar.to_ical, filename: "mock_interview_#{mock_interview.id}.ics", type: "text/calendar"
  end

  def new
    @mock_interview = MockInterview.new
    @time_options = generate_time_options
  end

  def create
    @mock_interview = current_user.created_mock_interviews.build(
      mock_interview_params.merge(
        check_date_time: convert_to_est(
          mock_interview_params[:start_date],
          mock_interview_params[:start_time],
          mock_interview_params[:time_zone]
        ),
      )
    )
    @mock_interview.time_zone = mock_interview_params[:time_zone]

    if @mock_interview.save
      redirect_to meeting_board_mock_interviews_path, notice: "Availability added successfully."
    else
      # Collect all error messages and join them into a single string
      error_messages = @mock_interview.errors.full_messages.join(", ")
      # Handle re-rendering of the form with errors
      @time_options = generate_time_options
      flash.now[:alert] = "There was an error with your submission."
      # render :meeting_board
      redirect_to meeting_board_mock_interviews_path, alert: "There was an error with your submission: #{error_messages}"
    end
  end

  def destroy
  end

  # Allows another user to accept a pending interview
  def accept

    if current_user.nil?
      # User is not signed in
      redirect_to meeting_board_mock_interviews_path, alert: "You must sign in and have a mock interview profile to accept a meeting."
      return
    elsif current_user.mock_interview_profile.nil?
      # User is signed in but does not have a mock interview profile
      redirect_to meeting_board_mock_interviews_path, alert: "You must create a mock interview profile to accept a meeting."
      return
    end

    @mock_interview = MockInterview.find(params[:id])

    if @mock_interview.status == "pending" && @mock_interview.created_by != current_user
      if @mock_interview.update(accepted_by: current_user, status: "accepted")
        redirect_to mock_interviews_path, notice: "You have successfully joined the mock interview."
      else
        redirect_to meeting_board_mock_interviews_path, alert: "Unable to accept the mock interview due to an error."
      end
    else
      redirect_to meeting_board_mock_interviews_path, alert: "You cannot accept this mock interview."
    end
  end

  # Marks an interview as completed
  def complete
    if @mock_interview.status == "accepted"
      @mock_interview.update(status: "completed")

      # Update total_completes and recalculate reliability for both users
      [@mock_interview.created_by, @mock_interview.accepted_by].each do |user|
        profile = user.mock_interview_profile
        profile.increment!(:total_completes)
        profile.calculate_reliability
      end

      redirect_to mock_interviews_path, notice: "Mock interview marked as completed."
    else
      redirect_to mock_interviews_path, alert: "Unable to mark the mock interview as completed."
    end
  end

  def reset
    @mock_interview = MockInterview.find(params[:id])
    if @mock_interview.accepted_by == current_user || @mock_interview.created_by == current_user
      @mock_interview.update(status: "pending", accepted_by: nil)
      redirect_to meeting_board_mock_interviews_path, notice: "You have successfully reset the mock interview."
    else
      redirect_to meeting_board_mock_interviews_path, alert: "You are not authorized to reset this mock interview."
    end
  end

  def cancel
    @mock_interview = MockInterview.find(params[:id])

    if @mock_interview.created_by == current_user
      @mock_interview.cancel_by_creator
      redirect_to meeting_board_mock_interviews_path, notice: "Meeting successfully cancelled."
    else
      redirect_to meeting_board_mock_interviews_path, alert: "You are not authorized to cancel this meeting."
    end
  end

  # Displays "Your Meetings" page
  def index
    if current_user.present?
      MockInterview.update_statuses_for_current_user(current_user)
    end

    # Set the default time zone based on the user's MockInterviewProfile
    if current_user.present?
      @default_time_zone = current_user.mock_interview_profile&.time_zone || "Eastern Time (US & Canada)"
    else
      @default_time_zone = "Eastern Time (US & Canada)"
    end

    @selected_time_zone = params[:time_zone] || @default_time_zone

    if current_user.present?
      @mock_interview_profile = current_user.mock_interview_profile || current_user.build_mock_interview_profile
    end

    @accepted_mock_interviews = MockInterview.where(status: "accepted")

    # Fetching completed mock interviews
    @completed_mock_interviews = if current_user.present?
        MockInterview.where(status: "completed")
                     .where("check_date_time <= ?", Time.current + 1.hour)
                     .where("created_by_id = :user_id OR accepted_by_id = :user_id", user_id: current_user.id)
                     .order(check_date_time: :desc)
                     .includes(:created_by, :accepted_by)
      else
        []
      end

    @past_meetings = [
      { title: "Mock Interview with Emily Johnson", date: "2025-01-10", time: "11:00 AM", description: "A detailed session on behavioral interviews" },
      { title: "Technical Interview with Mark Lee", date: "2025-01-08", time: "3:00 PM", description: "Focused on finance technical skills" },
    ]

    # Fetch recruiting options for the profile
    set_recruiting_for_options
  end

  # Displays the meeting board
  def meeting_board
    if current_user.present?
      MockInterview.update_statuses_for_current_user(current_user)
    end

    MockInterview.update_statuses

    # Set the default time zone based on the user's MockInterviewProfile
    if current_user.present?
      @default_time_zone = current_user.mock_interview_profile&.time_zone || "Eastern Time (US & Canada)"
    else
      @default_time_zone = "Eastern Time (US & Canada)"
    end

    @selected_time_zone = params[:time_zone] || @default_time_zone

    # Filter available meetings
    filter_meetings

    @mock_interview = MockInterview.new

    if current_user.present?
      @mock_interview_profile = current_user.mock_interview_profile || current_user.build_mock_interview_profile
    end
    # Fetch recruiting options for the profile
    set_recruiting_for_options

    # Fetch time options for the availability dropdown
    @time_options = generate_time_options
    @selected_time = @time_options.first[1] # Default to the first time slot if not provided
  end

  private

  def set_mock_interview
    @mock_interview = MockInterview.find(params[:id])
  end

  # Set recruiting options for the dropdown
  def set_recruiting_for_options
    @recruiting_for_options = [
      "Investment Banking",
      "Private Equity",
      "Venture Capital",
      "Consulting",
      "Corporate Development",
      "Hedge Fund",
    ]
  end

  # Generate time options for the dropdown
  def generate_time_options
    start_time = Time.parse("12:00 AM") # Start of the day
    end_time = Time.parse("11:45 PM")  # End of the day
    interval = 15.minutes              # 15-minute intervals

    # Generate time slots and format them as "HH:MM AM/PM"
    (start_time.to_i..end_time.to_i).step(interval).map do |time|
      formatted_time = Time.at(time).strftime("%I:%M %p")
      [formatted_time, formatted_time] # Label and value
    end
  end

  def convert_to_est(date, time, time_zone)
    return nil if date.blank? || time.blank? || time_zone.blank?

    # Combine date and time, and parse it in the user's selected time zone
    time_with_zone = ActiveSupport::TimeZone[time_zone].parse("#{date} #{time}")

    # Ensure both date and time are converted to Eastern Time
    time_with_zone&.in_time_zone("Eastern Time (US & Canada)")
  end

  def filter_meetings
    @q = MockInterview.ransack(params[:q])
    @pending_mock_interviews = @q.result
                             .includes(created_by: :mock_interview_profile)
                             .where(status: "pending")
                             .order(Arel.sql("(ABS(EXTRACT(EPOCH FROM check_date_time) - EXTRACT(EPOCH FROM NOW()))) ASC"))
  end

  def update_mock_interview_statuses
    MockInterview.update_statuses_by_time
  end

  def mock_interview_params
    params.require(:mock_interview).permit(:start_date, :start_time, :time_zone)
  end
end
