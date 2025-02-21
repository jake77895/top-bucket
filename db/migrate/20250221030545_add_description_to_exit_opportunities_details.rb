class AddDescriptionToExitOpportunitiesDetails < ActiveRecord::Migration[7.1]
  def change
    add_column :exit_opportunities_details, :description, :text
  end
end
