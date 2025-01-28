class CreateCareerAggregateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :career_aggregate_jobs do |t|
      t.string :job_title
      t.string :company
      t.string :industry
      t.string :group
      t.decimal :average_salary, precision: 10, scale: 2
      t.decimal :average_bonus, precision: 10, scale: 2
      t.integer :average_hours_worked_per_week
      t.integer :sample_size
      t.integer :year
      t.string :level
      t.string :sub_level

      t.timestamps
    end
  end
end
