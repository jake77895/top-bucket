class CreateMockInterviewProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :mock_interview_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :recruiting_for
      t.integer :technical_prep_level
      t.string :organization
      t.string :linkedin_url
      t.string :preferred_language
      t.integer :english_proficiency

      t.timestamps
    end
  end
end
