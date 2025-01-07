# == Schema Information
#
# Table name: page_associations
#
#  id               :bigint           not null, primary key
#  association_type :string
#  metadata         :jsonb
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  employee_view_id :bigint
#  page_id          :bigint           not null
#  tier_list_id     :bigint           not null
#
# Indexes
#
#  index_page_associations_on_employee_view_id              (employee_view_id)
#  index_page_associations_on_page_id                       (page_id)
#  index_page_associations_on_page_id_and_employee_view_id  (page_id,employee_view_id) UNIQUE WHERE (employee_view_id IS NOT NULL)
#  index_page_associations_on_page_id_and_tier_list_id      (page_id,tier_list_id) UNIQUE
#  index_page_associations_on_tier_list_id                  (tier_list_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_view_id => employee_views.id)
#  fk_rails_...  (page_id => pages.id)
#  fk_rails_...  (tier_list_id => tier_lists.id)
#
class PageAssociation < ApplicationRecord
  belongs_to :page
  belongs_to :tier_list, optional: true
  belongs_to :employee_view, optional: true

  validates :page_id, presence: true
  validates :tier_list_id, uniqueness: { scope: :page_id, message: 'This tier list is already associated with this page.' }, if: -> { tier_list_id.present? }
  validates :employee_view_id, uniqueness: { scope: :page_id, message: 'This employee view is already associated with this page.' }, if: -> { employee_view_id.present? }
end
