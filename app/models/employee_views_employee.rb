class EmployeeViewsEmployee < ApplicationRecord
  belongs_to :employee
  belongs_to :employee_view
end
