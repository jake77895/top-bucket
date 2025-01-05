class CreateJobLevels < ActiveRecord::Migration[7.1]
  def change
    create_table :job_levels do |t|
      t.string :name
      t.string :company_type
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
