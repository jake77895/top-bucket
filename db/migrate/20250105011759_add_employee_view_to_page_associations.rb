class AddEmployeeViewToPageAssociations < ActiveRecord::Migration[7.1]
  def change
    add_reference :page_associations, :employee_view, foreign_key: true, null: true
  end
end

