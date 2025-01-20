class RemoveReliabilityFlagsFromMockInterviews < ActiveRecord::Migration[7.1]
  def change
    remove_column :mock_interviews, :reliability_flag_creator, :integer
    remove_column :mock_interviews, :reliability_flag_acceptor, :integer
  end
end
