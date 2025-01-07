# == Schema Information
#
# Table name: flags
#
#  id             :bigint           not null, primary key
#  flaggable_type :string           not null
#  reason         :string
#  status         :string           default("pending")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  flaggable_id   :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_flags_on_flaggable  (flaggable_type,flaggable_id)
#  index_flags_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Flag < ApplicationRecord
  belongs_to :flaggable, polymorphic: true
  belongs_to :user

  validates :reason, presence: true
  validates :status, inclusion: { in: %w[pending resolved rejected], message: "%{value} is not a valid status" }
end
