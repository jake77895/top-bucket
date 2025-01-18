class AddCheckDateTimeToMockInterviews < ActiveRecord::Migration[7.1]
  def change
    add_column :mock_interviews, :check_date_time, :datetime
  end
end
