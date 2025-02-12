class AddRelatedGroupToQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :related_group, :string
  end
end
