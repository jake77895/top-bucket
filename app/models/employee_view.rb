# == Schema Information
#
# Table name: employee_views
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  picture     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class EmployeeView < ApplicationRecord
  has_many :employees
  has_many :page_associations, dependent: :destroy
  has_many :pages, through: :page_associations

  has_and_belongs_to_many :employees, join_table: 'employee_views_employees'

  validates :name, presence: true

  # Mount CarrierWave uploader
  mount_uploader :picture, ImageUploader

  # Virtual attribute for removing the picture
  def remove_picture=(value)
    if value == '1' || value == true
      self.remove_picture!
    end
  end

  def remove_picture
    false
  end
end
