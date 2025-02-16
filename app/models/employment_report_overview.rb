# == Schema Information
#
# Table name: employment_report_overviews
#
#  id                     :bigint           not null, primary key
#  average_salary         :integer
#  class_size             :integer
#  continuing_education   :decimal(, )
#  job_offers_3_months    :decimal(, )
#  not_seeking_employment :decimal(, )
#  not_seeking_other      :decimal(, )
#  postponing_job_search  :decimal(, )
#  seeking_employment     :decimal(, )
#  sponsored              :decimal(, )
#  starting_own_business  :decimal(, )
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  employment_report_id   :bigint           not null
#
# Indexes
#
#  index_employment_report_overviews_on_employment_report_id  (employment_report_id)
#
# Foreign Keys
#
#  fk_rails_...  (employment_report_id => employment_reports.id)
#
class EmploymentReportOverview < ApplicationRecord
  belongs_to :employment_report
end
