# == Schema Information
#
# Table name: employment_reports
#
#  id                           :bigint           not null, primary key
#  year                         :integer
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  employment_report_program_id :bigint           not null
#
# Indexes
#
#  index_employment_reports_on_employment_report_program_id  (employment_report_program_id)
#
# Foreign Keys
#
#  fk_rails_...  (employment_report_program_id => employment_report_programs.id)
#
class EmploymentReport < ApplicationRecord
  belongs_to :employment_report_program
  has_one :employment_report_overview
  has_one :employment_report_industry
  has_one :employment_report_location
  has_one :employment_report_employer
end
