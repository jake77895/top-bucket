class CreateEmploymentReportOverviews < ActiveRecord::Migration[7.1]
  def change
    create_table :employment_report_overviews do |t|
      t.references :employment_report, null: false, foreign_key: true
      t.integer :class_size
      t.decimal :seeking_employment
      t.decimal :not_seeking_employment
      t.decimal :sponsored
      t.decimal :starting_own_business
      t.decimal :continuing_education
      t.decimal :postponing_job_search
      t.decimal :not_seeking_other
      t.decimal :job_offers_3_months

      t.timestamps
    end
  end
end
