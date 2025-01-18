# == Schema Information
#
# Table name: mock_interviews
#
#  id             :bigint           not null, primary key
#  start_date     :date             not null
#  start_time     :time             not null
#  status         :string           default("pending"), not null
#  time_zone      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  accepted_by_id :bigint
#  created_by_id  :bigint           not null
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

  private
  
  def start_time_in_future
    return if start_date.blank? || start_time.blank?
  
    # Combine start_date and start_time into a full datetime object
    full_start_datetime = Time.zone.parse("#{start_date} #{start_time}")
    Rails.logger.debug("Full Start Datetime (UTC): #{full_start_datetime}")
  
    # Get the current time in UTC
    now = Time.zone.now
    Rails.logger.debug("Current Time (UTC): #{now}")
  
    # Adjust now to match the start_date's date
    now_fixed_date = Time.zone.parse("#{start_date} #{now.strftime('%H:%M:%S')}")
    Rails.logger.debug("Now Fixed to Start Date (UTC): #{now_fixed_date}")
  
    # Validate that the start time is at least 30 minutes in the future
    if full_start_datetime < now_fixed_date + 30.minutes
      errors.add(:start_time, "must be at least 30 minutes from now")
    end
  end
  
end
