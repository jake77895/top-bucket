# app/models/point_action.rb
class PointAction < ApplicationRecord
  has_many :user_point_transactions, foreign_key: :action_id
  
  validates :action_name, presence: true, uniqueness: true
  validates :point_value, presence: true, numericality: { only_integer: true }
end
