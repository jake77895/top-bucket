# == Schema Information
#
# Table name: groups
#
#  id                    :bigint           not null, primary key
#  name                  :string           not null
#  position_type_default :boolean          default(FALSE)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  company_id            :bigint
#  location_id           :bigint
#  position_type_id      :bigint
#
# Indexes
#
#  index_groups_on_company_id        (company_id)
#  index_groups_on_location_id       (location_id)
#  index_groups_on_position_type_id  (position_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (location_id => locations.id)
#  fk_rails_...  (position_type_id => position_types.id)
#
class Group < ApplicationRecord
  belongs_to :company, optional: true
  belongs_to :location, optional: true
  belongs_to :position_type, optional: true

  has_many :employees, dependent: :nullify

  validates :name, presence: true
end
