# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  name       :string
#  picture    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Item < ApplicationRecord
  # Image handling with CarrierWave
  mount_uploader :picture, ImageUploader

  # Associations
  has_many :item_ranks, dependent: :destroy
  has_many :tier_lists, through: :item_ranks
  has_many :comments, as: :commentable, dependent: :destroy

  # Validations
  validates :name, presence: true
end
