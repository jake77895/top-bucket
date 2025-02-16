class CreateEmploymentReportFunctions < ActiveRecord::Migration[7.1]
  def change
    create_table :employment_report_functions do |t|
      t.references :employment_report, null: false, foreign_key: true
      t.decimal :consulting
      t.decimal :corporate_strategy
      t.decimal :investment_banking
      t.decimal :investment_management
      t.decimal :private_equity
      t.decimal :real_estate
      t.decimal :venture_capital
      t.decimal :marketing
      t.decimal :brand_management
      t.decimal :product_management_tech

      t.timestamps
    end
  end
end
