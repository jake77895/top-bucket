class CreateTierLists < ActiveRecord::Migration[7.1]
  def change
    create_table :tier_lists do |t|
      t.string :name
      t.text :description
      t.boolean :published
      t.json :custom_fields

      t.timestamps
    end
  end
end
