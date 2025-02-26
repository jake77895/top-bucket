# app/services/point_service.rb
class PointService
  def self.award_points(user_id, action_name, reference_id: nil, reference_type: nil, metadata: {})
    action = PointAction.find_by(action_name: action_name, is_active: true)
    return false unless action

    UserPointTransaction.create!(
      user_id: user_id,
      action_id: action.id,
      points_earned: action.point_value,
      reference_id: reference_id,
      reference_type: reference_type,
      metadata: metadata
    )
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error("Failed to award points: #{e.message}")
    false
  end
end
