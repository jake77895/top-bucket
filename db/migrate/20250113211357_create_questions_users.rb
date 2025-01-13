class CreateQuestionsUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :questions_users do |t|
      t.references :question, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :starred, default: true

      t.timestamps
    end
    add_index :questions_users, [:question_id, :user_id], unique: true
  end
end
