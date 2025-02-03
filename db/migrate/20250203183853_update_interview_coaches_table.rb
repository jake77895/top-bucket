class UpdateInterviewCoachesTable < ActiveRecord::Migration[7.1]
  def change
    change_column_null :interview_coaches, :name, false
    change_column_null :interview_coaches, :industry, false
    change_column_null :interview_coaches, :highlighted_job, false
    rename_column :interview_coaches, :coaching_industry, :other_industries
  end
end
