class AddPictureToTierLists < ActiveRecord::Migration[7.1]
  def change
    add_column :tier_lists, :picture, :string
  end
end
