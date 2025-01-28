# == Schema Information
#
# Table name: schools
#
#  id             :bigint           not null, primary key
#  mba            :boolean          default(FALSE), not null
#  name           :string
#  other          :boolean          default(FALSE), not null
#  other_graduate :boolean          default(FALSE), not null
#  undergraduate  :boolean          default(FALSE), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class School < ApplicationRecord
  has_many :employees

  validates :name, presence: true, uniqueness: true
end
