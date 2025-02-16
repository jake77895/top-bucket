class ForceDropEmploymentReportDetails < ActiveRecord::Migration[7.1]
  def up
    drop_table :employment_report_details if table_exists?(:employment_report_details)
  end

  def down
    create_table :employment_report_details do |t|
      t.references :employment_report, null: false, foreign_key: true
      t.string :metric
      t.decimal :value

      t.timestamps
    end
  end
end
