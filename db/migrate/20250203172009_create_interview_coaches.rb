class CreateInterviewCoaches < ActiveRecord::Migration[7.1]
  def change
    create_table :interview_coaches do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :linkedin_url
      t.string :industry
      t.text :description
      t.string :languages
      t.string :coaching_industry
      t.string :highlighted_job

      t.timestamps
    end

  end
end
