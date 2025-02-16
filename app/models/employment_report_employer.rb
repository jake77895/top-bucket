# == Schema Information
#
# Table name: employment_report_employers
#
#  id                   :bigint           not null, primary key
#  accenture            :boolean
#  adobe                :boolean
#  alixpartners         :boolean
#  alvarez_marsal       :boolean
#  amazon               :boolean
#  amgen                :boolean          default(FALSE)
#  analysis_group       :boolean
#  apple                :boolean          default(FALSE)
#  bain                 :boolean
#  bank_of_america      :boolean
#  barclays             :boolean
#  bcg                  :boolean
#  blackarch            :boolean
#  capital_one          :boolean
#  cigna                :boolean
#  citigroup            :boolean
#  conagra              :boolean
#  davita               :boolean
#  dell                 :boolean
#  deloitte             :boolean
#  eli_lilly            :boolean
#  evercore             :boolean
#  goldman_sachs        :boolean
#  google               :boolean
#  guggenheim           :boolean
#  hershey              :boolean
#  jefferies            :boolean
#  johnson_and_johnson  :boolean          default(FALSE)
#  jpmorgan             :boolean
#  kearney              :boolean
#  kimberly_clark       :boolean          default(FALSE)
#  kraft_heinz          :boolean          default(FALSE)
#  lazard               :boolean
#  lek                  :boolean
#  mckinsey             :boolean
#  mcmaster_carr        :boolean          default(FALSE)
#  microsoft            :boolean
#  morgan_stanley       :boolean
#  nike                 :boolean          default(FALSE)
#  oliver_wyman         :boolean
#  parthenon            :boolean
#  pepsico              :boolean
#  pg                   :boolean
#  pwc                  :boolean
#  samsung              :boolean
#  tiktok               :boolean
#  ubs                  :boolean
#  unitedhealth         :boolean
#  vanguard             :boolean
#  visa                 :boolean
#  walmart              :boolean
#  wells_fargo          :boolean
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  employment_report_id :bigint           not null
#
# Indexes
#
#  index_employment_report_employers_on_employment_report_id  (employment_report_id)
#
# Foreign Keys
#
#  fk_rails_...  (employment_report_id => employment_reports.id)
#
class EmploymentReportEmployer < ApplicationRecord
  belongs_to :employment_report
end
