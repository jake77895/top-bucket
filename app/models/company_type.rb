# == Schema Information
#
# Table name: company_types
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class CompanyType < ApplicationRecord
  has_many :companies, dependent: :nullify

  validates :name, presence: true, uniqueness: true
end
