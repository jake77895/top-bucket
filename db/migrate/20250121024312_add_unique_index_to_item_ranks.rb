class AddUniqueIndexToItemRanks < ActiveRecord::Migration[7.1]
  def change
    add_index :item_ranks, [:item_id, :tier_list_id, :user_id], unique: true, name: 'unique_item_rank_per_user'
  end
end
