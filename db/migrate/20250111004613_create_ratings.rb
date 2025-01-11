# db/migrate/[timestamp]_create_ratings.rb
class CreateRatings < ActiveRecord::Migration[7.1]
  def change
    create_table :ratings do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :form_context, null: false
      t.jsonb :responses, default: {}
      t.text :comment
      t.timestamps
    end
  end
end
