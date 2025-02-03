class AddEducationFieldsToCareerAggregateJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :career_aggregate_jobs, :previous_undergrad, :string
    add_column :career_aggregate_jobs, :previous_grad, :string
    add_column :career_aggregate_jobs, :previous_mba, :string
  end
end
