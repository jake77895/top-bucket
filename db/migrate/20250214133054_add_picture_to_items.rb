class AddPictureToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :picture, :string
  end
end
