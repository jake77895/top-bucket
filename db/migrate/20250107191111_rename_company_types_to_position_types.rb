class RenameCompanyTypesToPositionTypes < ActiveRecord::Migration[7.1]
  def change
    # Rename the table
    rename_table :company_types, :position_types
    
    # Update foreign key reference in relevant tables
    rename_column :companies, :company_type_id, :position_type_id if column_exists?(:companies, :company_type_id)
    rename_column :job_levels, :company_type, :position_type if column_exists?(:job_levels, :company_type)
  end
end

