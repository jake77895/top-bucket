class CreateQuestionPackets < ActiveRecord::Migration[7.1]
  def change
    create_table :question_packets do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_index :question_packets, :name, unique: true
  end
end
