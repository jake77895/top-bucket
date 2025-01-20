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

  # Ensure reliability metric is always between 0 and 100
  validates :reliability_metric, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 100
  }

  MAX_RELIABILITY = 100
  MIN_RELIABILITY = 0

  def calculate_reliability
    # Base reliability from total completes
    completes_score = 50 + (20 * Math.log(total_completes + 1)).floor

    # Penalty for no-shows (exponential impact)
    no_show_penalty = no_show_count**2 * 5

    # Penalty for late arrivals (moderate impact)
    late_penalty = late_count * 3

    # Calculate the final reliability metric
    reliability = completes_score - no_show_penalty - late_penalty
    reliability = [[reliability, MIN_RELIABILITY].max, MAX_RELIABILITY].min

    update!(reliability_metric: reliability)
  end

  # Add this method to explicitly allow attributes to be searchable
  def self.ransackable_attributes(auth_object = nil)
    %w[first_name organization recruiting_for technical_prep_level preferred_language]
  end
end
