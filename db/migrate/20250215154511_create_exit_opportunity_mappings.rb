class CreateExitOpportunityMappings < ActiveRecord::Migration[7.1]
  def change
    create_table :exit_opportunity_mappings do |t|
      t.string :source_category    # e.g., "Investment Banking"
      t.string :target_node_name   # The name of the node that's an exit opp
      t.integer :likelihood, null: true  # Explicitly set null: true
      t.timestamps
    end

    add_index :exit_opportunity_mappings, [:source_category, :target_node_name], 
              name: 'index_exit_opp_mappings_on_category_and_target'
  end
end
