class AddReliabilityMetricToMockInterviewProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :mock_interview_profiles, :reliability_metric, :integer, default: 50, null: false
  end
end
