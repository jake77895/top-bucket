def find_position_type_id(name)
  PositionType.find_by(name: name)&.id || raise("PositionType '#{name}' not found")
end

form_templates = [
  { form_context: "networking", question_text: "How would you describe the tone of the conversation?", response_type: "dropdown", position_type_id: find_position_type_id('Investment Banking'), position: 1 },
  { form_context: "networking", question_text: "Were you asked any technical questions?", response_type: "yes/no", position_type_id: find_position_type_id('Investment Banking'), position: 2 },
  { form_context: "networking", question_text: "Were you asked about a deal?", response_type: "yes/no", position_type_id: find_position_type_id('Investment Banking'), position: 3 },
  { form_context: "networking", question_text: "Were you asked about a market trend?", response_type: "yes/no", position_type_id: find_position_type_id('Investment Banking'), position: 4 },
  { form_context: "networking", question_text: "How would you rate your interaction?", response_type: "dropdown", position_type_id: find_position_type_id('Investment Banking'), position: 5 },
  { form_context: "networking", question_text: "Were you referred to another colleague?", response_type: "yes/no", position_type_id: find_position_type_id('Investment Banking'), position: 6 },
  { form_context: "interview", question_text: "How would you describe the tone of the interview?", response_type: "dropdown", position_type_id: find_position_type_id('Investment Banking'), position: 1 },
  { form_context: "interview", question_text: "Were you asked about a deal?", response_type: "yes/no", position_type_id: find_position_type_id('Investment Banking'), position: 2 },
  { form_context: "interview", question_text: "Were you asked about a market trend?", response_type: "yes/no", position_type_id: find_position_type_id('Investment Banking'), position: 3 },
  { form_context: "interview", question_text: "Did you receive a job offer?", response_type: "dropdown", position_type_id: find_position_type_id('Investment Banking'), position: 7 },
  { form_context: "interview", question_text: "What was your overall impression of the interview?", response_type: "dropdown", position_type_id: find_position_type_id('Investment Banking'), position: 6 },
  { form_context: "interview", question_text: "How difficult were the technical questions?", response_type: "dropdown", position_type_id: find_position_type_id('Investment Banking'), position: 4 },
  { form_context: "interview", question_text: "Was this part of a superday or final round interview?", response_type: "yes/no", position_type_id: find_position_type_id('Investment Banking'), position: 5 }
]

form_templates.each do |template|
  FormTemplate.create!(template)
end

puts "Seeded #{form_templates.size} form templates!"
