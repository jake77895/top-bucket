# == Schema Information
#
# Table name: position_types
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class PositionType < ApplicationRecord
  has_many :companies
  has_many :job_levels
  has_many :form_templates

  validates :name, presence: true, uniqueness: true
end
