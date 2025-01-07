class MakeEmployeeFieldsNullable < ActiveRecord::Migration[7.1]
  def change
    change_column_null :employees, :job_level_id, true
    change_column_null :employees, :company_id, true
    change_column_null :employees, :group_id, true
    change_column_null :employees, :location_id, true
  end
end
