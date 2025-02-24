# == Schema Information
#
# Table name: employee_verifications
#
#  id                       :bigint           not null, primary key
#  user_verifications_count :integer          default(0)
#  verified_by_admin        :boolean          default(FALSE)
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  employee_id              :bigint           not null
#
# Indexes
#
#  index_employee_verifications_on_employee_id  (employee_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id) ON DELETE => cascade
#
class EmployeeVerification < ApplicationRecord
  belongs_to :employee
end
