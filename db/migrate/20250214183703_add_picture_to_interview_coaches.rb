class AddPictureToInterviewCoaches < ActiveRecord::Migration[7.1]
  def change
    add_column :interview_coaches, :picture, :string
  end
end
