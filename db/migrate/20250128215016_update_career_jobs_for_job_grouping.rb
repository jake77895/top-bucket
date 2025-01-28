class UpdateCareerJobsForJobGrouping < ActiveRecord::Migration[7.1]
  def change
    # Remove old columns
    remove_column :career_jobs, :previous_job_id, :bigint
    remove_column :career_jobs, :next_job_id, :bigint

    # Add new columns
    add_column :career_jobs, :job_grouping, :integer
    add_column :career_jobs, :job_order, :integer
  end
end
