class CreateEmploymentReportDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :employment_report_details do |t|
      t.references :employment_report, null: false, foreign_key: true
      t.string :metric
      t.decimal :value

      t.timestamps
    end
  end
end
