class CreateEmploymentReports < ActiveRecord::Migration[7.1]
  def change
    create_table :employment_reports do |t|
      t.references :employment_report_program, null: false, foreign_key: true
      t.integer :year

      t.timestamps
    end
  end
end
