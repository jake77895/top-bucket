class AddGroupToCareerCompensations < ActiveRecord::Migration[7.1]
  def change
    add_column :career_compensations, :group, :string
  end
end
