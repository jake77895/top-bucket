class CreateMockInterviews < ActiveRecord::Migration[7.1]
  def change
    create_table :mock_interviews do |t|
      t.date :start_date, null: false
      t.time :start_time, null: false
      t.string :status, null: false, default: "pending"
      t.references :created_by, null: false, foreign_key: { to_table: :users }
      t.references :accepted_by, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
