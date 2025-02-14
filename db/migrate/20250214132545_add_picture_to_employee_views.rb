class AddPictureToEmployeeViews < ActiveRecord::Migration[7.1]
  def change
    add_column :employee_views, :picture, :string
  end
end
