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
#
# Indexes
#
#  index_item_ranks_on_item_id       (item_id)
#  index_item_ranks_on_tier_list_id  (tier_list_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#  fk_rails_...  (tier_list_id => tier_lists.id)
#
class ItemRank < ApplicationRecord
  belongs_to :item
  belongs_to :tier_list

  validates :custom_values, presence: true

end
