class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :tier_list, null: false, foreign_key: true
      t.references :commentable, polymorphic: true, index: true
      t.references :user, foreign_key: true
      t.text :content, null: false

      t.timestamps
    end
  end
end
