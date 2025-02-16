class CreateEmploymentReportLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :employment_report_locations do |t|
      t.references :employment_report, null: false, foreign_key: true
      t.decimal :united_states
      t.decimal :northeast
      t.decimal :midwest
      t.decimal :west
      t.decimal :southwest
      t.decimal :south
      t.decimal :mid_atlantic
      t.decimal :international

      t.timestamps
    end
  end
end
