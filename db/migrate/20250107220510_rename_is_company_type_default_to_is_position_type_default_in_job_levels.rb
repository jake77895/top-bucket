class RenameIsCompanyTypeDefaultToIsPositionTypeDefaultInJobLevels < ActiveRecord::Migration[7.1]
  def change
    rename_column :job_levels, :is_company_type_default, :is_position_type_default
  end
end

