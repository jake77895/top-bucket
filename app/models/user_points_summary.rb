# app/models/user_points_summary.rb
class UserPointsSummary < ApplicationRecord
  belongs_to :user
  
  validates :total_points, presence: true, numericality: { only_integer: true }
end
