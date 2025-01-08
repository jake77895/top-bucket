class SplitSchoolIdInEmployees < ActiveRecord::Migration[7.1]
  def change
    # Remove the existing school_id column
    remove_reference :employees, :school, foreign_key: true

    # Add undergraduate and graduate school references
    add_reference :employees, :undergraduate_school, foreign_key: { to_table: :schools }, null: true
    add_reference :employees, :graduate_school, foreign_key: { to_table: :schools }, null: true
  end
end
