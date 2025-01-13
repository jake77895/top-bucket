# == Schema Information
#
# Table name: question_packet_memberships
#
#  id                 :bigint           not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  question_id        :bigint           not null
#  question_packet_id :bigint           not null
#
# Indexes
#
#  index_question_packet_memberships_on_question_id         (question_id)
#  index_question_packet_memberships_on_question_packet_id  (question_packet_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#  fk_rails_...  (question_packet_id => question_packets.id)
#
class QuestionPacketMembership < ApplicationRecord
  belongs_to :question
  belongs_to :question_packet
end
