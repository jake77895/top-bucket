class CreateFlags < ActiveRecord::Migration[7.1]
  def change
    create_table :flags do |t|
      t.references :flaggable, polymorphic: true, null: false
      t.references :user, null: false, foreign_key: true
      t.string :reason
      t.string :status, default: 'pending'

      t.timestamps
    end
  end
end
