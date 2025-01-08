class ChangeCompanyIdToBeNullableInJobLevels < ActiveRecord::Migration[6.1]
  def change
    change_column_null :job_levels, :company_id, true
  end
end
