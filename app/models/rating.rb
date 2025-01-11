# == Schema Information
#
# Table name: ratings
#
#  id           :bigint           not null, primary key
#  comment      :text
#  form_context :string           not null
#  responses    :jsonb
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  employee_id  :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_ratings_on_employee_id  (employee_id)
#  index_ratings_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#  fk_rails_...  (user_id => users.id)
#
class Rating < ApplicationRecord
  belongs_to :employee
  belongs_to :user

  validates :form_context, :responses, presence: true
end
