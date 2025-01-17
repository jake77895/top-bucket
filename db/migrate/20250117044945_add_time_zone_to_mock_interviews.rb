class AddTimeZoneToMockInterviews < ActiveRecord::Migration[7.1]
  def change
    add_column :mock_interviews, :time_zone, :string
  end
end
