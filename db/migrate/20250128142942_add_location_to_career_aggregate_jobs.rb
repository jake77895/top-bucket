class AddLocationToCareerAggregateJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :career_aggregate_jobs, :location, :string
  end
end
