class AddPreviousUndergradAndPreviousGradToCareerJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :career_jobs, :previous_undergrad, :string, null: true
    add_column :career_jobs, :previous_grad, :string, null: true
  end
end
