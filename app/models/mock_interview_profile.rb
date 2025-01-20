# == Schema Information
#
# Table name: mock_interview_profiles
#
#  id                   :bigint           not null, primary key
#  english_proficiency  :integer
#  first_name           :string
#  late_count           :integer          default(0), not null
#  linkedin_url         :string
#  no_show_count        :integer          default(0), not null
#  organization         :string
#  preferred_language   :string
#  recruiting_for       :string
#  reliability_metric   :integer          default(50), not null
#  technical_prep_level :string
#  time_zone            :string           default("Eastern Time (US & Canada)")
#  total_completes      :integer          default(0), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :bigint           not null
#
# Indexes
#
#  index_mock_interview_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class MockInterviewProfile < ApplicationRecord
  
  belongs_to :user

  validates :first_name, :recruiting_for, :technical_prep_level, presence: true
  validates :linkedin_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "must be a valid URL" }, allow_blank: true
  validate :user_must_have_profile_to_accept, if: -> { accepted_by.present? }

  # Ensure reliability metric is always between 0 and 100
  validates :reliability_metric, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100
  }

  MAX_RELIABILITY = 100
  MIN_RELIABILITY = 0

  def calculate_reliability
    # Start with the current reliability metric
    reliability = reliability_metric || 50 # Default to 50 if `reliability_metric` is nil
  
    # Base reliability from total completes
    completes_score = (5 * total_completes) # Each completion adds a flat 5 points
  
    # Penalty for no-shows (fixed impact)
    no_show_penalty = no_show_count * 15 # Each no-show deducts 15 points
  
    # Penalty for late arrivals (fixed impact)
    late_penalty = late_count * 10 # Each late deducts 10 points
  
    # Calculate the final reliability metric
    reliability = reliability + completes_score - no_show_penalty - late_penalty
  
    # Clamp the reliability score to be within the allowed range
    reliability = [[reliability, MIN_RELIABILITY].max, MAX_RELIABILITY].min
  
    # Update the reliability_metric attribute in the database
    update!(reliability_metric: reliability)
  end
  

  # Add this method to explicitly allow attributes to be searchable
  def self.ransackable_attributes(auth_object = nil)
    %w[first_name organization recruiting_for technical_prep_level preferred_language]
  end

  private

  def user_must_have_profile_to_accept
    unless accepted_by&.mock_interview_profile
      errors.add(:accepted_by, "must have a mock interview profile to accept a meeting.")
    end
  end

end
