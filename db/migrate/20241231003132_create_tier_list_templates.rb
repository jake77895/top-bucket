class CreateTierListTemplates < ActiveRecord::Migration[7.1]
  def change
    create_table :tier_list_templates do |t|
      t.string :name, null: false
      t.text :short_description
      t.json :custom_fields, default: []
      t.integer :created_by_id, null: false

      t.timestamps
    end

    add_index :tier_list_templates, :created_by_id
  end
end
