class AddOtherInfoToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :other_info, :string
  end
end
