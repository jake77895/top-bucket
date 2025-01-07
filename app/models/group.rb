# == Schema Information
#
# Table name: groups
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :bigint           not null
#  location_id :bigint           not null
#
# Indexes
#
#  index_groups_on_company_id   (company_id)
#  index_groups_on_location_id  (location_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (location_id => locations.id)
#
class Group < ApplicationRecord
  belongs_to :company
  belongs_to :location

  has_many :employees, dependent: :nullify

  validates :name, presence: true
end
