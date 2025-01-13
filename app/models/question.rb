class Question < ApplicationRecord
  belongs_to :position_type

  validates :question_text, :answer_choice_1, :answer_choice_2, :answer_choice_3, :answer_choice_4, :correct_answer, :explanation_text, :category, presence: true
  validates :correct_answer, inclusion: { in: 1..4 }
  validates :difficulty_level, inclusion: { in: 1..5 }, allow_nil: true
end
