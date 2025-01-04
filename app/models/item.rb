# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Item < ApplicationRecord
  has_one_attached :picture
  has_many :item_ranks, dependent: :destroy
  has_many :tier_lists, through: :item_ranks
  
  has_many :comments, as: :commentable, dependent: :destroy

  validates :name, presence: true
end
