class CreateEmployeeVerifications < ActiveRecord::Migration[7.1]
  def change
    create_table :employee_verifications do |t|
      t.references :employee, null: false, foreign_key: { on_delete: :cascade }
      t.boolean :verified_by_admin, default: false
      t.integer :user_verifications_count, default: 0
      t.timestamps
    end

    add_index :employee_verifications, :employee_id
  end
end
