module EmployeeRecapOverviewStats
  extend ActiveSupport::Concern

  included do
    # Optional helpers for controllers
  end

  def load_form_questions(employee, form_context)
    FormTemplate.where(
      position_type_id: employee.position_type_id,
      form_context: form_context
    )
  end

  def load_ratings_for_employee(employee, form_context)
    employee.ratings.includes(:user).where(form_context: form_context)
  end

  def calculate_ib_networking_summary_metrics(employee, ratings)
    # Extract responses and ensure they are compact and usable
    responses = ratings.pluck(:responses).map { |r| r&.compact }.compact
    Rails.logger.debug "Extracted Responses for Networking: #{responses.inspect}"
  
    if employee.position_type&.name == "Investment Banking"
      # Dynamically fetch question IDs
      technical_question_id = find_question_id("Were you asked any technical questions?", "networking")
      deal_question_id = find_question_id("Were you asked about a deal?", "networking")
      trend_question_id = find_question_id("Were you asked about a market trend?", "networking")
      referred_question_id = find_question_id("Were you referred to another colleague?", "networking")
  
      if responses.any?
        @asked_technical = calculate_percentage(responses, technical_question_id, "yes")
        @asked_deal = calculate_percentage(responses, deal_question_id, "yes")
        @asked_trend = calculate_percentage(responses, trend_question_id, "yes")
        @passed_next_round = calculate_percentage(responses, referred_question_id, "yes")
      end
  
      # Tones
      tone_question_id = find_question_id("How would you describe the tone of the conversation?", "networking")
      tones = responses.map { |r| r[tone_question_id] }.compact
      @most_common_tones = calculate_common_tones(tones) if tones.any?
    end
  
    @total_recaps = ratings.size
  end

  def calculate_ib_interview_summary_metrics(employee, ratings)
    responses = ratings.pluck(:responses).map { |r| r&.compact }.compact
    Rails.logger.debug "Extracted Responses for Interview: #{responses.inspect}"
  
    if employee.position_type&.name == "Investment Banking"
      # Dynamically fetch question IDs
      deal_question_id = find_question_id("Were you asked about a deal?", "interview")
      trend_question_id = find_question_id("Were you asked about a market trend?", "interview")
  
      if responses.any?
        @asked_deal = calculate_percentage(responses, deal_question_id, "yes")
        @asked_trend = calculate_percentage(responses, trend_question_id, "yes")
      end
  
      # Tones
      tone_question_id = find_question_id("How would you describe the tone of the interview?", "interview")
      tones = responses.map { |r| r[tone_question_id] }.compact
      @most_common_tones = calculate_common_tones(tones) if tones.any?
    end
  
    @total_recaps = ratings.size
  end

  def overall_ib_networking_impression(employee, ratings)
    impression_counts = calculate_impression_counts(ratings, "How would you rate your interaction?", "networking")
    @impression_data = map_impression_counts(impression_counts)
  end

  def overall_ib_interview_impression(employee, ratings)
    impression_counts = calculate_impression_counts(ratings, "What was your overall impression of the interview?", "interview")
    @impression_data = map_impression_counts(impression_counts)
  end

  def calculate_impression_counts(ratings, question_text, form_context)
    question_id = find_question_id(question_text, form_context)
    Rails.logger.debug "Question ID for '#{question_text}': #{question_id}"
    responses = ratings.pluck(:responses).map { |r| r&.[](question_id) }.compact
    responses.tally
  end

  private

  # Dynamically fetch the question ID based on text and context
  def find_question_id(question_text, form_context)
    FormTemplate.find_by(question_text: question_text, form_context: form_context)&.id.to_s.tap do |question_id|
      Rails.logger.debug "Question ID for '#{question_text}' in #{form_context}: #{question_id}"
    end
  end

  # Calculate percentage for a specific response
  def calculate_percentage(responses, question_id, expected_value)
    return 0 if responses.empty?
    (responses.count { |r| r[question_id] == expected_value } * 100.0 / responses.size).round
  end

  # Maps impression counts to predefined categories
  def map_impression_counts(impression_counts)
    {
      "Very Positive" => impression_counts["Very Positive"] || 0,
      "Positive" => impression_counts["Positive"] || 0,
      "Neutral" => impression_counts["Neutral"] || 0,
      "Negative" => impression_counts["Negative"] || 0
    }
  end

  def calculate_positive_impressions_percentage_ib_networking(impression_counts)
    mapped_counts = map_impression_counts(impression_counts)
  
    # Calculate positive impressions count
    positive_count = mapped_counts["Very Positive"] + mapped_counts["Positive"]
  
    # Calculate total impressions count
    total_count = mapped_counts.values.sum
  
    # Return percentage, handling division by zero
    return 0 if total_count.zero?
  
    (positive_count.to_f / total_count * 100).round
  end

  # Calculate the two most common tones
  def calculate_common_tones(tones)
    tone_counts = tones.tally
    tone_counts.sort_by { |_tone, count| -count }.take(2).map do |tone, count|
      [tone, (count * 100.0 / tones.size).round]
    end
  end

  # Maps technical difficulty counts to predefined categories
  def map_technical_difficulty_counts(difficulty_counts)
    {
      "Very Hard" => difficulty_counts["Very Hard"] || 0,
      "Hard" => difficulty_counts["Hard"] || 0,
      "Medium" => difficulty_counts["Medium"] || 0,
      "Easy" => difficulty_counts["Easy"] || 0
    }
  end

  # Calculates the percentage of "Hard" or "Very Hard" responses for technical questions
  def calculate_hard_technical_questions_percentage_ib_interview(difficulty_counts)
    # Map difficulty counts to predefined categories
    mapped_counts = map_technical_difficulty_counts(difficulty_counts)
    
    # Calculate count for "Very Hard" and "Hard"
    hard_count = mapped_counts["Very Hard"] + mapped_counts["Hard"]
    
    # Calculate total responses count
    total_count = mapped_counts.values.sum
    
    # Return percentage, handling division by zero
    return 0 if total_count.zero?
    
    (hard_count.to_f / total_count * 100).round
  end
end
