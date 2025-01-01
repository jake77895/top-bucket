class CreateItemRanks < ActiveRecord::Migration[7.1]
  def change
    create_table :item_ranks do |t|
      t.references :item, null: false, foreign_key: true
      t.references :tier_list, null: false, foreign_key: true
      t.json :custom_values
      t.integer :rank

      t.timestamps
    end
  end
end
