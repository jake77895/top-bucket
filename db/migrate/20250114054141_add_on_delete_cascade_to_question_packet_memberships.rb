class AddOnDeleteCascadeToQuestionPacketMemberships < ActiveRecord::Migration[7.1]
  def change
    # Remove the existing foreign keys
    remove_foreign_key :question_packet_memberships, :questions
    remove_foreign_key :question_packet_memberships, :question_packets

    # Add the foreign keys with ON DELETE CASCADE
    add_foreign_key :question_packet_memberships, :questions, on_delete: :cascade
    add_foreign_key :question_packet_memberships, :question_packets, on_delete: :cascade
  end
end
