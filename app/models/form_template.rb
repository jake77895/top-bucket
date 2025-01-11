# == Schema Information
#
# Table name: form_templates
#
#  id               :bigint           not null, primary key
#  form_context     :string           not null
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

  validates :form_context, :question_text, :response_type, presence: true
end
