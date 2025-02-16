class CreateEmploymentReportEmployers < ActiveRecord::Migration[7.1]
  def change
    create_table :employment_report_employers do |t|
      t.references :employment_report, null: false, foreign_key: true
      t.boolean :bcg
      t.boolean :mckinsey
      t.boolean :bain
      t.boolean :amazon
      t.boolean :goldman_sachs
      t.boolean :jpmorgan
      t.boolean :bank_of_america
      t.boolean :citigroup
      t.boolean :deloitte
      t.boolean :lek
      t.boolean :capital_one
      t.boolean :parthenon
      t.boolean :tiktok
      t.boolean :evercore
      t.boolean :google
      t.boolean :morgan_stanley
      t.boolean :guggenheim
      t.boolean :lazard
      t.boolean :samsung
      t.boolean :ubs
      t.boolean :walmart
      t.boolean :kearney
      t.boolean :oliver_wyman
      t.boolean :alixpartners
      t.boolean :analysis_group
      t.boolean :pwc
      t.boolean :accenture
      t.boolean :alvarez_marsal
      t.boolean :wells_fargo
      t.boolean :barclays
      t.boolean :jefferies
      t.boolean :visa
      t.boolean :blackarch
      t.boolean :vanguard
      t.boolean :dell
      t.boolean :adobe
      t.boolean :microsoft
      t.boolean :davita
      t.boolean :unitedhealth
      t.boolean :cigna
      t.boolean :eli_lilly
      t.boolean :pg
      t.boolean :pepsico
      t.boolean :conagra
      t.boolean :hershey

      t.timestamps
    end
  end
end
