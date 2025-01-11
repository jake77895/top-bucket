# == Schema Information
#
# Table name: form_templates
#
#  id               :bigint           not null, primary key
#  form_context     :string           not null
#  position         :integer
#  question_text    :string           not null
#  response_type    :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  position_type_id :bigint           not null
#
# Indexes
#
#  index_form_templates_on_position_type_id  (position_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (position_type_id => position_types.id)
#
class FormTemplate < ApplicationRecord
  belongs_to :position_type
  before_validation :set_default_position, on: :create

  validates :form_context, :question_text, :response_type, presence: true
  
  # Default scope to order by position
  default_scope { order(:position) }

  private

  def set_default_position
    self.position ||= (FormTemplate.maximum(:position) || 0) + 1
  end
end
