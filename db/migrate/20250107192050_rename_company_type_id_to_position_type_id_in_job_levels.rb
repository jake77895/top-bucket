class RenameCompanyTypeIdToPositionTypeIdInJobLevels < ActiveRecord::Migration[7.1]
  def change
    # Rename column if it exists
    if column_exists?(:job_levels, :company_type_id)
      rename_column :job_levels, :company_type_id, :position_type_id
    end

    # Update indexes if they reference the old column
    if index_exists?(:job_levels, :company_type_id)
      remove_index :job_levels, :company_type_id
      add_index :job_levels, :position_type_id
    end

    if index_exists?(:job_levels, [:name, :company_id, :company_type_id])
      remove_index :job_levels, column: [:name, :company_id, :company_type_id]
      add_index :job_levels, [:name, :company_id, :position_type_id], unique: true
    end
  end
end
