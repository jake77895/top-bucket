class AddTimeZoneToMockInterviewProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :mock_interview_profiles, :time_zone, :string, default: "Eastern Time (US & Canada)"
  end
end
