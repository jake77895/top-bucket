class CreateEmployeeViews < ActiveRecord::Migration[7.1]
  def change
    create_table :employee_views do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
