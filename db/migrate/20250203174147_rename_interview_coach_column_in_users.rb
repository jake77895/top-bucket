class RenameInterviewCoachColumnInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :interview_coach, :is_interview_coach
  end
end
