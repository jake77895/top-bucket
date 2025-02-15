# == Schema Information
#
# Table name: interview_coaches
#
#  id               :bigint           not null, primary key
#  description      :text
#  highlighted_job  :string           not null
#  industry         :string           not null
#  languages        :string
#  linkedin_url     :string
#  name             :string           not null
#  other_industries :string
#  picture          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_interview_coaches_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class InterviewCoach < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  # Mount CarrierWave uploader for profile picture
  mount_uploader :picture, ImageUploader

  validates :linkedin_url, format: { 
    with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), 
    message: "must be a valid URL" 
  }, allow_blank: true

end
