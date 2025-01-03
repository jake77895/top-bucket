class CreatePageAssociations < ActiveRecord::Migration[7.1]
  def change
    create_table :page_associations do |t|
      t.references :page, null: false, foreign_key: true
      t.references :tier_list, null: false, foreign_key: true
      t.string :association_type # Optional, for future associations
      t.jsonb :metadata, default: {} # Optional, to store extra info

      t.timestamps
    end

    add_index :page_associations, [:page_id, :tier_list_id], unique: true
  end
end
