# == Schema Information
#
# Table name: questions
#
#  id                   :bigint           not null, primary key
#  answer_choice_1      :string           not null
#  answer_choice_2      :string           not null
#  answer_choice_3      :string           not null
#  answer_choice_4      :string           not null
#  behavior             :boolean          default(FALSE), not null
#  category             :string           not null
#  correct_answer       :integer          not null
#  difficulty_level     :integer
#  explanation_text     :text             not null
#  question_link        :string
#  question_link_order  :integer
#  question_text        :string           not null
#  related_organization :string
#  technical            :boolean          default(FALSE), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  position_type_id     :bigint           not null
#
# Indexes
#
#  index_questions_on_position_type_id  (position_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (position_type_id => position_types.id)
#
class Question < ApplicationRecord
  belongs_to :position_type

  # Associations for starred questions
  has_many :questions_users, dependent: :destroy
  has_many :users, through: :questions_users

  # Associations for question packets
  has_many :question_packet_memberships, dependent: :destroy
  has_many :question_packets, through: :question_packet_memberships

  # Validations
  validates :question_text, :answer_choice_1, :answer_choice_2, :answer_choice_3, :answer_choice_4, :correct_answer, :explanation_text, :category, presence: true
  validates :correct_answer, inclusion: { in: 1..4 }
  validates :difficulty_level, inclusion: { in: 1..5 }, allow_nil: true

  def self.question_of_the_day
    Rails.cache.fetch("question_of_the_day", expires_in: 24.hours) do
      Question.order("RANDOM()").first
    end
  end
end
