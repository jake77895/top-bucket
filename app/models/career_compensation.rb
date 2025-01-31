# == Schema Information
#
# Table name: career_compensations
#
#  id                    :bigint           not null, primary key
#  bonus                 :decimal(10, 2)
#  group                 :string
#  hours_worked_per_week :integer
#  level                 :string
#  salary                :decimal(10, 2)
#  sub_level             :string
#  year                  :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  career_job_id         :bigint           not null
#
# Indexes
#
#  index_career_compensations_on_career_job_id  (career_job_id)
#
# Foreign Keys
#
#  fk_rails_...  (career_job_id => career_jobs.id) ON DELETE => cascade
#
class CareerCompensation < ApplicationRecord
  belongs_to :career_job

  validates :group, presence: true
  validates :level, presence: true
  validates :sub_level, presence: true
  validates :salary, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 3000000}
  validates :bonus, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 3000000 }
  validates :hours_worked_per_week, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 120 }

end
