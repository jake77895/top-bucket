class RemoveGroupFromCareerJobs < ActiveRecord::Migration[7.1]
  def change
    remove_column :career_jobs, :group, :string
  end
end
