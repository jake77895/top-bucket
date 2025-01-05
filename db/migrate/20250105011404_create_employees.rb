class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.references :job_level, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.references :previous_company, foreign_key: { to_table: :companies }
      t.string :linkedin_url
      t.integer :flagged, default: 0, null: false
      t.text :flag_comment
      t.references :group, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.references :school, foreign_key: true

      t.timestamps
    end

    # Add indexes for frequently queried fields
    add_index :employees, :name
    add_index :employees, :linkedin_url
    add_index :employees, :flagged
  end
end
