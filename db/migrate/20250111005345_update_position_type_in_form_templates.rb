class UpdatePositionTypeInFormTemplates < ActiveRecord::Migration[7.1]
  def change
    remove_column :form_templates, :position_type, :string
    add_reference :form_templates, :position_type, null: false, foreign_key: true
  end
end
