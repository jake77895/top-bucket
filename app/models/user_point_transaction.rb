# app/models/user_point_transaction.rb
class UserPointTransaction < ApplicationRecord
  belongs_to :user
  belongs_to :action, class_name: 'PointAction'
  
  validates :points_earned, presence: true, numericality: { only_integer: true }
  
  after_create :update_user_points_summary, if: -> { defined?(UserPointsSummary) }
  
  private
  
  def update_user_points_summary
    summary = UserPointsSummary.find_or_initialize_by(user_id: user_id)
    summary.total_points = (summary.total_points || 0) + points_earned
    summary.last_updated = Time.current
    summary.save!
  end
end
