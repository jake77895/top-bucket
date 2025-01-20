class AddTrackingColumnsToMockInterviewProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :mock_interview_profiles, :no_show_count, :integer, default: 0, null: false
    add_column :mock_interview_profiles, :late_count, :integer, default: 0, null: false
    add_column :mock_interview_profiles, :total_completes, :integer, default: 0, null: false
  end
end
