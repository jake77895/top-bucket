class MakeCompanyIdAndLocationIdOptionalInGroups < ActiveRecord::Migration[7.1]
  def change
    change_column_null :groups, :company_id, true
    change_column_null :groups, :location_id, true
  end
end
