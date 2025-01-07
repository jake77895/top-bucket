# == Schema Information
#
# Table name: companies
#
#  id              :bigint           not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_type_id :bigint           not null
#
# Indexes
#
#  index_companies_on_company_type_id  (company_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_type_id => company_types.id)
#
class Company < ApplicationRecord
  belongs_to :company_type

  has_many :employees
  has_many :groups
  has_many :job_levels, through: :company_type

  validates :name, presence: true, uniqueness: true
  validates :company_type, presence: true
end
