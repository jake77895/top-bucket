class PageAssociation < ApplicationRecord
  belongs_to :page
  belongs_to :tier_list

  validates :page_id, uniqueness: { scope: :tier_list_id, message: 'This association already exists.' }
end
