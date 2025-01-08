# == Schema Information
#
# Table name: companies
#
#  id               :bigint           not null, primary key
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  position_type_id :bigint           not null
#
# Indexes
#
#  index_companies_on_position_type_id  (position_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (position_type_id => position_types.id)
#
class Company < ApplicationRecord
  belongs_to :position_type

  has_many :employees
  has_many :groups
  has_many :job_levels

  validates :name, presence: true, uniqueness: true
  validates :position_type, presence: true
end
