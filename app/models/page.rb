# == Schema Information
#
# Table name: pages
#
#  id                :bigint           not null, primary key
#  about             :text
#  category          :string           default("general"), not null
#  created_by        :integer
#  name              :string           not null
#  short_description :text
#  slug              :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  parent_id         :integer
#
# Indexes
#
#  index_pages_on_created_by  (created_by)
#  index_pages_on_parent_id   (parent_id)
#  index_pages_on_slug        (slug) UNIQUE
#
class Page < ApplicationRecord

  has_one_attached :cover_image
  has_one_attached :profile_image

  has_many :page_associations, dependent: :destroy
  has_many :tier_lists, through: :page_associations

  # Custom validation for cover_image
  validate :acceptable_cover_image
  validate :acceptable_profile_image

  acts_as_tree order: 'name'

  belongs_to :creator, class_name: 'User', foreign_key: 'created_by', optional: true

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :category, presence: true

  before_validation :generate_slug, on: :create

  CATEGORY_OPTIONS = ['General', 'Banking'].freeze

  private

  def generate_slug
    self.slug = name.parameterize if slug.blank?
  end

  def acceptable_cover_image
    return unless cover_image.attached?

    unless cover_image.content_type.in?(%w[image/png image/jpg image/jpeg])
      errors.add(:cover_image, 'must be a PNG or JPG')
    end

    if cover_image.byte_size > 5.megabytes
      errors.add(:cover_image, 'size must be less than 5MB')
    end
  end

  def acceptable_profile_image
    return unless profile_image.attached?

    unless profile_image.content_type.in?(%w[image/png image/jpg image/jpeg])
      errors.add(:profile_image, 'must be a PNG or JPG')
    end

    if profile_image.byte_size > 5.megabytes
      errors.add(:profile_image, 'size must be less than 5MB')
    end
  end
  
end
