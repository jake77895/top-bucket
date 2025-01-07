class UpdateJobLevelsTable < ActiveRecord::Migration[7.1]
  def change
    change_table :job_levels do |t|
      # Add a numeric rank field to represent the level across companies
      t.integer :level_rank, null: false, default: 1
      
      # Add flag fields for defaults
      t.boolean :is_global_default, default: false, null: false
      t.boolean :is_company_type_default, default: false, null: false

      # Update company_type to reference company_types table
      t.remove :company_type
      t.references :company_type, foreign_key: { to_table: :company_types }, null: true
    end

    # Add an index to ensure unique level names per company and company type
    add_index :job_levels, [:name, :company_id, :company_type_id], unique: true, name: 'index_job_levels_on_name_and_company_and_type'
  end
end
