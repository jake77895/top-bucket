# == Schema Information
#
# Table name: mock_interviews
#
#  id                        :bigint           not null, primary key
#  acceptor_reliability_flag :string
#  check_date_time           :datetime
#  creator_reliability_flag  :string
#  start_date                :date             not null
#  start_time                :time             not null
#  status                    :string           default("pending"), not null
#  time_zone                 :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  accepted_by_id            :bigint
#  created_by_id             :bigint           not null
#
# Indexes
#
#  index_mock_interviews_on_accepted_by_id  (accepted_by_id)
#  index_mock_interviews_on_created_by_id   (created_by_id)
#
# Foreign Keys
#
#  fk_rails_...  (accepted_by_id => users.id)
#  fk_rails_...  (created_by_id => users.id)
#
class MockInterview < ApplicationRecord
  belongs_to :created_by, class_name: "User"
  belongs_to :accepted_by, class_name: "User", optional: true

  validates :start_date, presence: true
  validates :start_time, presence: true
  validates :status, inclusion: { in: %w[pending accepted completed cancelled] }
  validate :start_time_in_future, if: :validate_start_time?

  # Custom validation to restrict pending interviews
  validate :pending_interview_limit, on: :create

  # Custom validation to restrict overlapping meetings
  validate :no_overlapping_meetings, on: :create

  # Add this method to explicitly allow attributes to be searchable
  def self.ransackable_attributes(auth_object = nil)
    %w[start_date check_date_time status] +
    %w[created_by_id accepted_by_id time_zone] +
    MockInterviewProfile.ransackable_attributes
  end

  # Allow associations to be included in searches
  def self.ransackable_associations(auth_object = nil)
    %w[created_by created_by.mock_interview_profile]
  end

  def cancel_by_creator
    update!(status: "cancelled")
  end

  # Update statuses based on the current time
  def self.update_statuses_for_current_user(current_user)

    # Define time range for today
    today_start = Time.current.beginning_of_day
    today_end = Time.current.end_of_day
  
    # Narrow down the scope to only today's meetings involving the current_user
    scope = where("created_by_id = ? OR accepted_by_id = ?", current_user.id, current_user.id)
  
    # Cancel pending interviews that are overdue
    scope.where(status: "pending")
         .where("check_date_time < ?", Time.current - 10.minutes)
         .update_all(status: "cancelled", updated_at: Time.current)
  
    # Identify accepted interviews that are eligible to be completed
    completed_interviews = scope.where(status: "accepted")
                                .where("check_date_time < ?", Time.current - 1.hour)
  
    # Process each eligible interview
    completed_interviews.find_each do |mock_interview|
      # Update status explicitly to "completed"
      if mock_interview.update(status: "completed", updated_at: Time.current)
        # Update reliability for the users involved
        [mock_interview.created_by_id, mock_interview.accepted_by_id].each do |user_id|
          profile = User.find(user_id).mock_interview_profile
          profile.increment!(:total_completes)
          profile.calculate_reliability
        end
      end
    end

  end
  
  private
  
  def start_time_in_future
    Rails.logger.debug("Check if start time is called")

    return if start_date.blank? || start_time.blank?
    
    now = Time.current


    # Validate that the start time is at least 30 minutes in the future
    if check_date_time < now + 30.minutes
      errors.add(:start_time, "must be at least 30 minutes from now")
    end
  end

  # Determine if the validation should run
  def validate_start_time?
    new_record? || status == "accepted"
  end

  def pending_interview_limit
    # Count the number of pending interviews for the current user
    pending_count = MockInterview.where(created_by_id: created_by_id, status: "pending").count

    # Restrict creation if the count exceeds 5
    if pending_count >= 5
      errors.add(:base, "You can only have up to 5 pending interviews at a time.")
    end
  end

  def no_overlapping_meetings
    # Define the time range for this meeting
    meeting_start = check_date_time
    meeting_end = check_date_time + 1.hour

    # Check if any existing meetings overlap
    overlapping_meeting = MockInterview.where(created_by_id: created_by_id)
                                       .where.not(id: id) # Exclude the current meeting (important for updates)
                                       .where("check_date_time < ? AND check_date_time + INTERVAL '1 hour' > ?", meeting_end, meeting_start)
                                       .exists?

    if overlapping_meeting
      errors.add(:base, "You cannot create a meeting that overlaps with an existing one.")
    end
  end


  
end
