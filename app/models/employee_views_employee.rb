# == Schema Information
#
# Table name: employee_views_employees
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  employee_id      :bigint           not null
#  employee_view_id :bigint           not null
#
# Indexes
#
#  index_employee_views_employees_on_employee_id       (employee_id)
#  index_employee_views_employees_on_employee_view_id  (employee_view_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id) ON DELETE => cascade
#  fk_rails_...  (employee_view_id => employee_views.id)
#
class EmployeeViewsEmployee < ApplicationRecord
  belongs_to :employee
  belongs_to :employee_view
end
