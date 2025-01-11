# db/migrate/[timestamp]_create_form_templates.rb
class CreateFormTemplates < ActiveRecord::Migration[7.1]
  def change
    create_table :form_templates do |t|
      t.string :position_type, null: false
      t.string :form_context, null: false
      t.string :question_text, null: false
      t.string :response_type, null: false
      t.timestamps
    end

    add_index :form_templates, [:position_type, :form_context]
  end
end
