class CreateQuestionPacketMemberships < ActiveRecord::Migration[7.1]
  def change
    create_table :question_packet_memberships do |t|
      t.references :question, null: false, foreign_key: true
      t.references :question_packet, null: false, foreign_key: true
      t.timestamps
    end
  end
end
