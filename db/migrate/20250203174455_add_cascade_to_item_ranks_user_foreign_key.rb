class AddCascadeToItemRanksUserForeignKey < ActiveRecord::Migration[7.1]
  def change
    # Remove the existing foreign key constraint
    remove_foreign_key :item_ranks, :users

    # Add a new foreign key constraint with cascading deletes
    add_foreign_key :item_ranks, :users, on_delete: :cascade
  end
end
