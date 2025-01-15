class CreateForumComments < ActiveRecord::Migration[7.1]
  def change
    create_table :forum_comments do |t|
      t.text :body
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :parent_id

      t.timestamps
    end
    add_index :forum_comments, :parent_id
  end
end
