# db/migrate/YYYYMMDDHHMMSS_create_user_point_transactions.rb
class CreateUserPointTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :user_point_transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :action, null: false, foreign_key: { to_table: :point_actions }
      t.integer :points_earned, null: false
      t.bigint :reference_id
      t.string :reference_type
      t.jsonb :metadata
      t.timestamps
    end
    
    add_index :user_point_transactions, [:reference_id, :reference_type]
  end
end
