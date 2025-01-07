# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Location < ApplicationRecord
  has_many :employees
  has_many :groups

  validates :name, presence: true, uniqueness: true
end
