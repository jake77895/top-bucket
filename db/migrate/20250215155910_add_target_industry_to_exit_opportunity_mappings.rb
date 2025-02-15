class AddTargetIndustryToExitOpportunityMappings < ActiveRecord::Migration[7.1]
  def change
    add_column :exit_opportunity_mappings, :target_industry, :string
    
    # Remove old index if it exists
    remove_index :exit_opportunity_mappings, name: 'index_exit_opp_mappings_on_category_and_target', if_exists: true
    
    # Add new index including target_industry
    add_index :exit_opportunity_mappings, [:source_category, :target_node_name, :target_industry], 
              name: 'index_exit_opp_mappings_on_category_target_and_industry'
  end
end
