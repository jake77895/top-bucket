# == Schema Information
#
# Table name: mock_interview_profiles
#
#  id                   :bigint           not null, primary key
#  english_proficiency  :integer
#  first_name           :string
#  linkedin_url         :string
#  organization         :string
#  preferred_language   :string
#  recruiting_for       :string
#  technical_prep_level :string
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

  # enum technical_prep_level: { advanced: 0, intermediate: 1, beginner: 2 }
  # enum english_proficiency: { conversational: 0, basic: 1, no_proficiency: 2 }

  # Add this method to explicitly allow attributes to be searchable
  def self.ransackable_attributes(auth_object = nil)
    %w[first_name organization recruiting_for technical_prep_level preferred_language]
  end
end
