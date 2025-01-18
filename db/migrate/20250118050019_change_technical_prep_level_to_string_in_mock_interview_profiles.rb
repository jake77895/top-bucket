class ChangeTechnicalPrepLevelToStringInMockInterviewProfiles < ActiveRecord::Migration[7.1]
  def up
    change_column :mock_interview_profiles, :technical_prep_level, :string
  end

  def down
    change_column :mock_interview_profiles, :technical_prep_level, :integer, using: 'technical_prep_level::integer'
  end
end
