class QuestionPacket < ApplicationRecord
  has_many :question_packet_memberships, dependent: :destroy
  has_many :questions, through: :question_packet_memberships

  validates :name, presence: true, uniqueness: true
end
