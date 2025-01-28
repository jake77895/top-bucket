class CreateCareerCompensations < ActiveRecord::Migration[7.1]
  def change
    create_table :career_compensations do |t|
      t.references :career_job, null: false, foreign_key: true
      t.integer :year
      t.string :level
      t.string :sub_level
      t.decimal :salary, precision: 10, scale: 2
      t.decimal :bonus, precision: 10, scale: 2
      t.integer :hours_worked_per_week

      t.timestamps
    end
  end
end
