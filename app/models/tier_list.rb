# == Schema Information
#
# Table name: tier_lists
#
#  id                    :bigint           not null, primary key
#  category              :string
#  custom_fields         :json
#  description           :text
#  name                  :string           not null
#  picture               :string
#  published             :boolean
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  tier_list_template_id :bigint
#
# Indexes
#
#  index_tier_lists_on_tier_list_template_id  (tier_list_template_id)
#
# Foreign Keys
#
#  fk_rails_...  (tier_list_template_id => tier_list_templates.id)
#
class TierList < ApplicationRecord
  # Image handling with CarrierWave
  mount_uploader :picture, ImageUploader

  # Associations
  has_many :item_ranks, dependent: :destroy
  has_many :items, through: :item_ranks
  belongs_to :tier_list_template, optional: true

  has_many :page_associations, dependent: :destroy
  has_many :pages, through: :page_associations

  has_many :comments, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :published, inclusion: { in: [true, false] }

  # Constants
  DATA_TYPE_MAPPING = {
    'Text' => 'string',
    'Number' => 'integer',
    'True/False' => 'boolean',
    'Date' => 'date'
  }.freeze

  REVERSE_DATA_TYPE_MAPPING = DATA_TYPE_MAPPING.invert.freeze

  # Instance Methods
  def human_readable_type(type)
    REVERSE_DATA_TYPE_MAPPING[type] || type
  end

  # Prevent editing if published
  def editable?
    !published
  end

  # Prevent updating items unless published
  def items_editable?
    published
  end
end
