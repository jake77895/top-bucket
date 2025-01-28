class AddLocationToCareerJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :career_jobs, :location, :string
  end
end
