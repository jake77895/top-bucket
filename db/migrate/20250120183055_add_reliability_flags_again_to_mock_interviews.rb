class AddReliabilityFlagsAgainToMockInterviews < ActiveRecord::Migration[7.1]
  def change
    add_column :mock_interviews, :creator_reliability_flag, :string
    add_column :mock_interviews, :acceptor_reliability_flag, :string
  end
end
