class AddMoreEmploymentReportEmployerColumns < ActiveRecord::Migration[7.1]
  def change
    add_column :employment_report_employers, :amgen, :boolean, if_not_exists: true, default: false
    add_column :employment_report_employers, :apple, :boolean, if_not_exists: true, default: false
    add_column :employment_report_employers, :johnson_and_johnson, :boolean, if_not_exists: true, default: false
    add_column :employment_report_employers, :kimberly_clark, :boolean, if_not_exists: true, default: false
    add_column :employment_report_employers, :kraft_heinz, :boolean, if_not_exists: true, default: false
    add_column :employment_report_employers, :mcmaster_carr, :boolean, if_not_exists: true, default: false
    add_column :employment_report_employers, :nike, :boolean, if_not_exists: true, default: false
  end
end
