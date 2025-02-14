# == Schema Information
#
# Table name: pages
#
#  id                :bigint           not null, primary key
#  about             :text
#  category          :string           default("general"), not null
#  cover_image       :string
#  created_by        :integer
#  name              :string           not null
#  profile_image     :string
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

  mount_uploader :cover_image, ImageUploader
  mount_uploader :profile_image, ImageUploader

  has_many :page_associations, dependent: :destroy
  has_many :employee_views, through: :page_associations
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

  CATEGORY_OPTIONS = ['General', 'Banking', 'Consulting', 'Venture Capital','Hedge Funds'].freeze

  private

  def generate_slug
    self.slug = name.parameterize if slug.blank?
  end

  def acceptable_cover_image
    return unless cover_image.present?

    unless cover_image.content_type.in?(%w[image/png image/jpg image/jpeg])
      errors.add(:cover_image, 'must be a PNG or JPG')
    end

    if cover_image.size > 5.megabytes
      errors.add(:cover_image, 'size must be less than 5MB')
    end
  end

  def acceptable_profile_image
    return unless profile_image.present?

    unless profile_image.content_type.in?(%w[image/png image/jpg image/jpeg])
      errors.add(:profile_image, 'must be a PNG or JPG')
    end

    if profile_image.size > 5.megabytes
      errors.add(:profile_image, 'size must be less than 5MB')
    end
  end
  
end
