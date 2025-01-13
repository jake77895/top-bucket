# == Schema Information
#
# Table name: question_packets
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_question_packets_on_name  (name) UNIQUE
#
class QuestionPacket < ApplicationRecord
  has_many :question_packet_memberships, dependent: :destroy
  has_many :questions, through: :question_packet_memberships

  validates :name, presence: true, uniqueness: true
end
