# == Schema Information
#
# Table name: mock_interviews
#
#  id              :bigint           not null, primary key
#  check_date_time :datetime
#  start_date      :date             not null
#  start_time      :time             not null
#  status          :string           default("pending"), not null
#  time_zone       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  accepted_by_id  :bigint
#  created_by_id   :bigint           not null
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
  validates :status, inclusion: { in: %w[pending accepted completed] }
  validate :start_time_in_future

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

  private
  
  def start_time_in_future
    return if start_date.blank? || start_time.blank?
    
    now = Time.current

    # Validate that the start time is at least 30 minutes in the future
    if check_date_time < now + 30.minutes
      errors.add(:start_time, "must be at least 30 minutes from now")
    end
  end


  
end
