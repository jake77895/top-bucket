# == Schema Information
#
# Table name: item_ranks
#
#  id            :bigint           not null, primary key
#  custom_values :json
#  rank          :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  item_id       :bigint           not null
#  tier_list_id  :bigint           not null
#  user_id       :bigint
#
# Indexes
#
#  index_item_ranks_on_item_id       (item_id)
#  index_item_ranks_on_tier_list_id  (tier_list_id)
#  index_item_ranks_on_user_id       (user_id)
#  unique_item_rank_per_user         (item_id,tier_list_id,user_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#  fk_rails_...  (tier_list_id => tier_lists.id)
#  fk_rails_...  (user_id => users.id) ON DELETE => cascade
#
class ItemRank < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item
  belongs_to :tier_list
  before_save :normalize_custom_values

  validate :custom_values_presence
  validate :user_must_be_signed_in
  # validates :rank, presence: { message: "cannot be nil" }
  validates :item_id, uniqueness: { scope: [:tier_list_id, :user_id], message: "You have already ranked this item in this tier list" }


  private

  def custom_values_presence
    if tier_list.custom_fields.present? && custom_values.blank?
      errors.add(:custom_values, "can't be blank when tier list has custom fields")
    end
  end


  def normalize_custom_values
    if custom_values.is_a?(Hash)
      self.custom_values = custom_values.values
    end
  end

  def user_must_be_signed_in
    if user.nil?
      errors.add(:user, "must be signed in to rank an item")
    end
  end
end
