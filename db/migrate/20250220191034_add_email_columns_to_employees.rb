class AddEmailColumnsToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :email, :string
    add_index :employees, :email
    add_column :employees, :email_used, :boolean
  end
end
