class CreateExitOpportunitiesDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :exit_opportunities_details do |t|
      t.references :exit_opportunity_mapping, null: false, foreign_key: true  # Changed this line
      t.string :target_company_name, null: false
      t.string :target_group
      t.string :source_company_name, null: false
      t.string :source_group
      
      t.timestamps
    end

    # Add indexes for frequently queried fields
    add_index :exit_opportunities_details, :target_company_name
    add_index :exit_opportunities_details, :source_company_name
  end
end
