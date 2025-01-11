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

  # Static dropdown options
  def self.dropdown_options_for(question_text)
    {
      # Investment Banking - Networking
      "How would you describe the tone of the conversation?" => ["Casual and Friendly", "Professional", "Tense or Confrontational", "Unengaged"],
      "How would you rate your interaction?" => ["Very Positive", "Positive", "Neutral", "Negative"],
      # Investment Banking - Interview
      "How difficult were the technical questions?" => ["Easy", "Medium", "Hard", "Very Hard"],
      "How would you describe the tone of the interview?" => ["Casual and Friendly", "Professional", "Tense or Confrontational", "Unengaged"],
      "Did you receive a job offer?" => ["Yes", "No", "Waitlisted", "Waiting on response"],
      "What was your overall impression of the interview?" => ["Positive", "Neutral", "Negative"]
    }[question_text] || []
  end

  # Fetch options for dropdown questions
  def options
    return [] unless response_type == 'dropdown'

    self.class.dropdown_options_for(question_text)
  end

  private

  def set_default_position
    max_position = FormTemplate.where(position_type_id: position_type_id, form_context: form_context).maximum(:position)
    self.position ||= (max_position || 0) + 1
  end
end
