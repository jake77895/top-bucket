class MockInterviewsController < ApplicationController
  before_action :set_mock_interview, only: %i[accept complete destroy]

  def new
    # Assuming the user's timezone is stored or default to UTC
    user_time_zone = Time.zone.name || "UTC"
    Time.zone = user_time_zone

    @default_time_zone = user_time_zone
    @default_start_time = (Time.zone.now + 1.hour).strftime("%I:%M %p")

    @mock_interview = MockInterview.new
    @time_options = generate_time_options
  end

  def create
    @mock_interview = current_user.created_mock_interviews.build(
      mock_interview_params.merge(
        start_time: convert_to_est(
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
      # Ensure variables are set for re-rendering the meeting_board
      Rails.logger.debug("Mock Interview Save Errors: #{@mock_interview.errors.full_messages}")
      @mock_interview_profile = current_user.mock_interview_profile || current_user.build_mock_interview_profile
      set_recruiting_for_options
      @time_options = generate_time_options
      @selected_time = @time_options.first[1] # Default to the first time slot
      flash.now[:alert] = "There was an error with your submission."
      render :meeting_board
    end
  end

  def destroy
  end

  # Allows another user to accept a pending interview
  def accept
    @mock_interview = MockInterview.find(params[:id])
    if @mock_interview.status == "pending" && @mock_interview.created_by != current_user
      @mock_interview.update(accepted_by: current_user, status: "accepted")
      redirect_to mock_interviews_path, notice: "You have successfully joined the mock interview."
    else
      redirect_to meeting_board_mock_interviews_path, alert: "Unable to accept the mock interview."
    end
  end

  # Marks an interview as completed
  def complete
    if @mock_interview.status == "accepted"
      @mock_interview.update(status: "completed")
      redirect_to mock_interviews_path, notice: "Mock interview marked as completed."
    else
      redirect_to mock_interviews_path, alert: "Unable to mark the mock interview as completed."
    end
  end

  # Displays "Your Meetings" page
  def index
    @mock_interview_profile = current_user.mock_interview_profile || current_user.build_mock_interview_profile

    @upcoming_meetings = [
      { title: "Mock Interview with Jane Doe", date: "2025-01-20", time: "10:00 AM" },
      { title: "Case Study with John Smith", date: "2025-01-22", time: "2:00 PM" },
    ]

    @past_meetings = [
      { title: "Mock Interview with Emily Johnson", date: "2025-01-10", time: "11:00 AM", description: "A detailed session on behavioral interviews" },
      { title: "Technical Interview with Mark Lee", date: "2025-01-08", time: "3:00 PM", description: "Focused on finance technical skills" },
    ]

    # Fetch recruiting options for the profile
    set_recruiting_for_options
  end

  # Displays the meeting board
  def meeting_board
    @mock_interview = MockInterview.new
    @mock_interview_profile = current_user.mock_interview_profile || current_user.build_mock_interview_profile

    # Fetch time options for the availability dropdown
    @time_options = generate_time_options
    @selected_time = @time_options.first[1] # Default to the first time slot if not provided

    # # Fetch pending mock interviews
    # @mock_interviews = MockInterview.where(status: "pending")

    # Fetch pending mock interviews
    @pending_mock_interviews = MockInterview.includes(created_by: :mock_interview_profile)
                                            .where(status: "pending")

    Rails.logger.debug("Pending Mock Interviews: #{@pending_mock_interviews.inspect}")

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

    # Convert to US Eastern Time
    time_with_zone&.in_time_zone("Eastern Time (US & Canada)")
  end

  def mock_interview_params
    params.require(:mock_interview).permit(:start_date, :start_time, :time_zone)
  end
  
  
end
