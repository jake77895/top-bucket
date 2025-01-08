class AddPositionTypeDefaultToGroups < ActiveRecord::Migration[7.1]
  def change
    add_column :groups, :position_type_default, :boolean, default: false
  end
end
