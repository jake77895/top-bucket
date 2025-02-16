# == Schema Information
#
# Table name: employment_report_details
#
#  id                   :bigint           not null, primary key
#  metric               :string
#  value                :decimal(, )
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  employment_report_id :bigint           not null
#
# Indexes
#
#  index_employment_report_details_on_employment_report_id  (employment_report_id)
#
# Foreign Keys
#
#  fk_rails_...  (employment_report_id => employment_reports.id)
#
class EmploymentReportDetail < ApplicationRecord
  belongs_to :employment_report
end
