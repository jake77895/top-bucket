# == Schema Information
#
# Table name: employment_report_locations
#
#  id                   :bigint           not null, primary key
#  international        :decimal(, )
#  mid_atlantic         :decimal(, )
#  midwest              :decimal(, )
#  northeast            :decimal(, )
#  south                :decimal(, )
#  southwest            :decimal(, )
#  united_states        :decimal(, )
#  west                 :decimal(, )
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  employment_report_id :bigint           not null
#
# Indexes
#
#  index_employment_report_locations_on_employment_report_id  (employment_report_id)
#
# Foreign Keys
#
#  fk_rails_...  (employment_report_id => employment_reports.id)
#
class EmploymentReportLocation < ApplicationRecord
  belongs_to :employment_report
end
