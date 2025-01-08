class AddPositionTypeIdToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :position_type_id, :bigint
  end
end
