class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      # Non-nullable fields
      t.string :question_text, null: false
      t.string :answer_choice_1, null: false
      t.string :answer_choice_2, null: false
      t.string :answer_choice_3, null: false
      t.string :answer_choice_4, null: false
      t.integer :correct_answer, null: false
      t.text :explanation_text, null: false
      t.boolean :technical, null: false, default: false
      t.boolean :behavior, null: false, default: false
      t.string :category, null: false
      t.references :position_type, null: false, foreign_key: true

      # Nullable fields
      t.integer :difficulty_level
      t.string :related_organization
      t.string :question_link
      t.integer :question_link_order

      t.timestamps
    end
  end
end
