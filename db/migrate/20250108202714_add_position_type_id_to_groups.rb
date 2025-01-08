class AddPositionTypeIdToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :position_type_id, :bigint
    add_index :groups, :position_type_id
    add_foreign_key :groups, :position_types
  end
end
