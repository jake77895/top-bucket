class ChangeNameNullConstraintInTierLists < ActiveRecord::Migration[7.1]
  def change
    change_column_null :tier_lists, :name, false
  end
end
