class AddUniqueIndexToPageAssociations < ActiveRecord::Migration[7.1]
  def change
    add_index :page_associations, [:page_id], unique: true, where: 'employee_view_id IS NOT NULL', name: 'unique_employee_view_per_page'
  end
end
