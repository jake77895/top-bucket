class AddDegreeTypesToSchools < ActiveRecord::Migration[7.1]
  def change
    add_column :schools, :undergraduate, :boolean, default: false, null: false
    add_column :schools, :mba, :boolean, default: false, null: false
    add_column :schools, :other_graduate, :boolean, default: false, null: false
    add_column :schools, :other, :boolean, default: false, null: false
  end
end
