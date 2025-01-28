# == Schema Information
#
# Table name: career_aggregate_jobs
#
#  id                            :bigint           not null, primary key
#  average_bonus                 :decimal(10, 2)
#  average_hours_worked_per_week :integer
#  average_salary                :decimal(10, 2)
#  company                       :string
#  group                         :string
#  industry                      :string
#  job_title                     :string
#  level                         :string
#  location                      :string
#  sample_size                   :integer
#  sub_level                     :string
#  year                          :integer
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
class CareerAggregateJob < ApplicationRecord
end
