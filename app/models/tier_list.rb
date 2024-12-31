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
  validates :name, presence: true
  validates :published, inclusion: { in: [true, false] }
end
