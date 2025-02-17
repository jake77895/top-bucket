class AddLikelihoodToExitOpportunitiesDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :exit_opportunities_details, :likelihood, :integer, null: false, default: 1
  end
end
