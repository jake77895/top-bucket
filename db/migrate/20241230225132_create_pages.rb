class CreatePages < ActiveRecord::Migration[7.1]
  def change
    create_table :pages do |t|
      t.string :name, null: false
      t.string :slug, null: false, index: { unique: true }
      t.integer :parent_id, index: true
      t.integer :created_by, index: true
      t.string :category, null: false, default: "general"
      t.text :short_description
      t.text :about
      t.timestamps
    end
  end
end
