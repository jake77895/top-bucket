class EnsureEmploymentReportIndustries < ActiveRecord::Migration[7.1]
  def up
    unless table_exists?(:employment_report_industries)
      create_table :employment_report_industries do |t|
        t.bigint :employment_report_id, null: false
        t.decimal :consulting
        t.decimal :investment_banking
        t.decimal :private_equity
        t.decimal :venture_capital
        t.decimal :marketing
        t.decimal :diversified_financial
        t.decimal :investment_management
        t.decimal :technology

        t.timestamps
      end

      add_index :employment_report_industries, :employment_report_id
      add_foreign_key :employment_report_industries, :employment_reports
    end
  end

  def down
    # Be careful with drop_table in production!
    # Only uncomment if you really need to reverse this migration
    # drop_table :employment_report_industries if table_exists?(:employment_report_industries)
  end
end
