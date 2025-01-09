# == Schema Information
#
# Table name: employee_views
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class EmployeeView < ApplicationRecord
  has_many :employees
  has_many :page_associations, dependent: :destroy
  has_many :pages, through: :page_associations

  has_and_belongs_to_many :employees, join_table: 'employee_views_employees'

  validates :name, presence: true

  has_one_attached :picture

  # Virtual attribute for removing the picture
  attr_accessor :remove_picture
end
