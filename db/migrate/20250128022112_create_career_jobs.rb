class CreateCareerJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :career_jobs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :company
      t.string :industry
      t.string :group
      t.integer :start_year
      t.integer :years_at_job
      t.references :previous_job, foreign_key: { to_table: :career_jobs }
      t.references :next_job, foreign_key: { to_table: :career_jobs }

      t.timestamps
    end
  end
end
