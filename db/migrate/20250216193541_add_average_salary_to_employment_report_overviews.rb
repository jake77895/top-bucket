class AddAverageSalaryToEmploymentReportOverviews < ActiveRecord::Migration[7.1]
  def change
    add_column :employment_report_overviews, :average_salary, :integer, if_not_exists: true, limit: 4
  end
end
