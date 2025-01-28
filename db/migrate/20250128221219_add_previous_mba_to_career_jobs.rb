class AddPreviousMbaToCareerJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :career_jobs, :previous_mba, :string, null: true
  end
end
