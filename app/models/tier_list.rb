# == Schema Information
#
# Table name: tier_lists
#
#  id            :bigint           not null, primary key
#  custom_fields :json
#  description   :text
#  name          :string
#  published     :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class TierList < ApplicationRecord
  has_one_attached :picture
  has_many :item_ranks, dependent: :destroy
  has_many :items, through: :item_ranks

  validates :name, presence: true
  validates :published, inclusion: { in: [true, false] }

  # Prevent editing if published
  def editable?
    !published
  end

  # Prevent updating items unless published
  def items_editable?
    published
  end
  
end
