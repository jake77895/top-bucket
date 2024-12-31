class AddTagToTierListTemplates < ActiveRecord::Migration[7.1]
  def change
    add_column :tier_list_templates, :tag, :string
  end
end
