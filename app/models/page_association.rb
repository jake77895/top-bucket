# == Schema Information
#
# Table name: page_associations
#
#  id               :bigint           not null, primary key
#  association_type :string
#  metadata         :jsonb
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  page_id          :bigint           not null
#  tier_list_id     :bigint           not null
#
# Indexes
#
#  index_page_associations_on_page_id                   (page_id)
#  index_page_associations_on_page_id_and_tier_list_id  (page_id,tier_list_id) UNIQUE
#  index_page_associations_on_tier_list_id              (tier_list_id)
#
# Foreign Keys
#
#  fk_rails_...  (page_id => pages.id)
#  fk_rails_...  (tier_list_id => tier_lists.id)
#
class PageAssociation < ApplicationRecord
  belongs_to :page
  belongs_to :tier_list

  validates :page_id, uniqueness: { scope: :tier_list_id, message: 'This association already exists.' }
end
