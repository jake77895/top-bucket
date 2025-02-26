# db/migrate/YYYYMMDDHHMMSS_create_point_actions.rb
class CreatePointActions < ActiveRecord::Migration[7.1]
  def change
    create_table :point_actions do |t|
      t.string :action_name, null: false
      t.integer :point_value, null: false
      t.text :description
      t.boolean :is_active, null: false, default: true
      t.timestamps
    end
    
    add_index :point_actions, :action_name, unique: true
  end
end
