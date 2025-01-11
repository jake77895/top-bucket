class AddPositionToFormTemplates < ActiveRecord::Migration[7.1]
  def change
    add_column :form_templates, :position, :integer
  end
end
