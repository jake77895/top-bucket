# == Schema Information
#
# Table name: questions_users
#
#  id          :bigint           not null, primary key
#  starred     :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_questions_users_on_question_id              (question_id)
#  index_questions_users_on_question_id_and_user_id  (question_id,user_id) UNIQUE
#  index_questions_users_on_user_id                  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#  fk_rails_...  (user_id => users.id)
#
class QuestionsUser < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :question_id, uniqueness: { scope: :user_id }
end
