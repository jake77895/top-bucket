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
#  previous_grad                 :string
#  previous_mba                  :string
#  previous_undergrad            :string
#  sample_size                   :integer
#  sub_level                     :string
#  year                          :integer
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
class CareerAggregateJob < ApplicationRecord
  # Define the list of searchable attributes for Ransack
  def self.ransackable_attributes(auth_object = nil)
    [
      "average_bonus",
      "average_hours_worked_per_week",
      "average_salary",
      "company",
      "created_at",
      "group",
      "id",
      "industry",
      "job_title",
      "level",
      "location",
      "sample_size",
      "sub_level",
      "updated_at",
      "year"
    ]
  end
end

