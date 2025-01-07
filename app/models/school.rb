# == Schema Information
#
# Table name: schools
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class School < ApplicationRecord
  has_many :employees

  validates :name, presence: true, uniqueness: true
end
