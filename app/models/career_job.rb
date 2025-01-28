# == Schema Information
#
# Table name: career_jobs
#
#  id              :bigint           not null, primary key
#  company         :string
#  industry        :string
#  location        :string
#  start_year      :integer
#  years_at_job    :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  next_job_id     :bigint
#  previous_job_id :bigint
#  user_id         :bigint           not null
#
# Indexes
#
#  index_career_jobs_on_next_job_id      (next_job_id)
#  index_career_jobs_on_previous_job_id  (previous_job_id)
#  index_career_jobs_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (next_job_id => career_jobs.id)
#  fk_rails_...  (previous_job_id => career_jobs.id)
#  fk_rails_...  (user_id => users.id)
#
class CareerJob < ApplicationRecord
  has_many :career_compensations, dependent: :destroy

  # Add these virtual attributes
  attr_accessor :matching_groups, :matching_job_levels

  validates :user_id, :company, presence: true

  belongs_to :user
  # belongs_to :previous_job
  # belongs_to :next_job
end
