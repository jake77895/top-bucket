class MakeTierListIdOptionalInPageAssociations < ActiveRecord::Migration[7.1]
  def change
    change_column_null :page_associations, :tier_list_id, true
  end
end
