# == Schema Information
#
# Table name: employment_report_programs
#
#  id           :bigint           not null, primary key
#  name         :string
#  program_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class EmploymentReportProgram < ApplicationRecord
  has_many :employment_reports
end
