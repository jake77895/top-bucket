class AddReliabilityFlagsToMockInterviews < ActiveRecord::Migration[7.1]
  def change
    add_column :mock_interviews, :reliability_flag_creator, :integer
    add_column :mock_interviews, :reliability_flag_acceptor, :integer
  end
end
