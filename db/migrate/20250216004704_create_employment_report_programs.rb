class CreateEmploymentReportPrograms < ActiveRecord::Migration[7.1]
  def change
    create_table :employment_report_programs do |t|
      t.string :name
      t.string :program_type

      t.timestamps
    end
  end
end
