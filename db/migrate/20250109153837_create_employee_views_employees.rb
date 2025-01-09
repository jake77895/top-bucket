class CreateEmployeeViewsEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employee_views_employees do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :employee_view, null: false, foreign_key: true

      t.timestamps
    end
  end
end
