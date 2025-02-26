# db/migrate/YYYYMMDDHHMMSS_create_user_points_summary.rb
class CreateUserPointsSummary < ActiveRecord::Migration[7.1]
  def change
    create_table :user_points_summary do |t|
      t.references :user, null: false, foreign_key: true, index: { unique: true }
      t.integer :total_points, null: false, default: 0
      t.timestamp :last_updated, null: false, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
