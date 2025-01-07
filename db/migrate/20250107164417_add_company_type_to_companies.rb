class AddCompanyTypeToCompanies < ActiveRecord::Migration[7.1]
  def change
    remove_column :companies, :company_type, :string
    add_reference :companies, :company_type, null: false, foreign_key: true
  end
end
