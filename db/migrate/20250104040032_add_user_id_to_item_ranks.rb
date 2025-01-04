class AddUserIdToItemRanks < ActiveRecord::Migration[7.1]
  def change
    add_reference :item_ranks, :user, null: true, foreign_key: true
  end
end
