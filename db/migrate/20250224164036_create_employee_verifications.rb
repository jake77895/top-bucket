class CreateEmployeeVerifications < ActiveRecord::Migration[7.1]
  def up
    # First drop the index if it exists
    execute "DROP INDEX IF EXISTS index_employee_verifications_on_employee_id"
    
    # Then drop the table if it exists
    execute "DROP TABLE IF EXISTS employee_verifications CASCADE"
    
    # Create the new table
    create_table :employee_verifications do |t|
      t.references :employee, null: false, foreign_key: { on_delete: :cascade }
      t.boolean :verified_by_admin, default: false
      t.integer :user_verifications_count, default: 0
      t.timestamps
    end

    # Let's not add the index here since it's causing problems
    # add_index :employee_verifications, :employee_id
  end

  def down
    drop_table :employee_verifications
  end
end
