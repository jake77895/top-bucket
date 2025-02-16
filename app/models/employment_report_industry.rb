# == Schema Information
#
# Table name: employment_report_functions
#
#  id                      :bigint           not null, primary key
#  brand_management        :decimal(, )
#  consulting              :decimal(, )
#  corporate_strategy      :decimal(, )
#  investment_banking      :decimal(, )
#  investment_management   :decimal(, )
#  marketing               :decimal(, )
#  private_equity          :decimal(, )
#  product_management_tech :decimal(, )
#  real_estate             :decimal(, )
#  venture_capital         :decimal(, )
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  employment_report_id    :bigint           not null
#
# Indexes
#
#  index_employment_report_functions_on_employment_report_id  (employment_report_id)
#
# Foreign Keys
#
#  fk_rails_...  (employment_report_id => employment_reports.id)
#
class EmploymentReportIndustry < ApplicationRecord
  belongs_to :employment_report
end
