class AddCascadeDeleteToCareerCompensations < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :career_compensations, :career_jobs

    add_foreign_key :career_compensations, :career_jobs, on_delete: :cascade
  end
end
