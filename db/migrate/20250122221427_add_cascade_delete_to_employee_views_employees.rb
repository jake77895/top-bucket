class AddCascadeDeleteToEmployeeViewsEmployees < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :employee_views_employees, :employees
    add_foreign_key :employee_views_employees, :employees, on_delete: :cascade
  end
end
