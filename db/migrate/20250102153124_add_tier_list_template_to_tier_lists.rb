class AddTierListTemplateToTierLists < ActiveRecord::Migration[7.1]
  def change
    add_reference :tier_lists, :tier_list_template, foreign_key: { to_table: :tier_list_templates }, null: true
  end
end
