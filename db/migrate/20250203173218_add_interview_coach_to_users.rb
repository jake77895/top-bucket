class AddInterviewCoachToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :interview_coach, :boolean, default: false, null: false
  end
end

