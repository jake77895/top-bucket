class AddCategoryToTierLists < ActiveRecord::Migration[7.1]
  def change
    add_column :tier_lists, :category, :string
  end
end
