# == Schema Information
#
# Table name: tier_list_templates
#
#  id                :bigint           not null, primary key
#  custom_fields     :json
#  name              :string           not null
#  short_description :text
#  tag               :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  created_by_id     :integer          not null
#
# Indexes
#
#  index_tier_list_templates_on_created_by_id  (created_by_id)
#
class TierListTemplate < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'created_by_id'

  validates :name, presence: true
  validate :validate_custom_fields_format

  DATA_TYPE_MAPPING = {
    'Text' => 'string',
    'Number' => 'integer',
    'True/False' => 'boolean',
    'Date' => 'date'
  }.freeze

  before_save :sanitize_custom_fields

  TAG_OPTIONS = [
    'Finance'
  ].freeze

  validates :tag, inclusion: { in: TAG_OPTIONS, message: "%{value} is not a valid tag" }, allow_blank: true

  private

  def validate_custom_fields_format
    return if custom_fields.blank?

    # Ensure it's an array
    self.custom_fields = custom_fields.is_a?(Array) ? custom_fields : custom_fields.values

    custom_fields.reject! { |field| field['name'].blank? }

    custom_fields.each do |field|
      field['type'] = DATA_TYPE_MAPPING[field['type']] || 'string' # Default to string if type is blank
    end
  end

  def sanitize_custom_fields
    self.custom_fields = custom_fields.reject { |field| field['name'].blank? }
  end
end
