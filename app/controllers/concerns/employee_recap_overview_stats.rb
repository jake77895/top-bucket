module EmployeeRecapOverviewStats
  extend ActiveSupport::Concern

  included do
    # Optionally include helper methods here
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def load_form_questions(form_context)
    FormTemplate.where(
      position_type_id: @employee.position_type_id,
      form_context: form_context
    )
  end

  def load_ratings(form_context)
    @employee.ratings.includes(:user).where(form_context: form_context)
  end

  def calculate_ib_networking_summary_metrics(ratings)
    # Extract responses and ensure they are compact and usable
    responses = ratings.pluck(:responses).map { |r| r&.compact }.compact
    Rails.logger.debug "Extracted Responses: #{responses.inspect}"
  
    form_context = "networking"
  
    if form_context == "networking" && @employee.position_type.name == "Investment Banking"
      Rails.logger.debug "In Conditional: #{form_context.inspect}"
  
      # Dynamically fetch question IDs
      technical_question_id = find_question_id("Were you asked any technical questions?", form_context)
      deal_question_id = find_question_id("Were you asked about a deal?", form_context)
      trend_question_id = find_question_id("Were you asked about a market trend?", form_context)
      referred_question_id = find_question_id("Were you referred to another colleague?", form_context)
  
      # Calculate percentages if responses exist
      if responses.size > 0
        @asked_technical = calculate_percentage(responses, technical_question_id, "yes")
        @asked_deal = calculate_percentage(responses, deal_question_id, "yes")
        @asked_trend = calculate_percentage(responses, trend_question_id, "yes")
        @passed_next_round = calculate_percentage(responses, referred_question_id, "yes")
      end
    end
  
    # Tones
    if form_context == "networking" && @employee.position_type.name == "Investment Banking"
      tone_question_id = find_question_id("How would you describe the tone of the conversation?", form_context)
      tones = responses.map { |r| r[tone_question_id] }.compact
      @most_common_tones = calculate_common_tones(tones) if tones.any?
    end
  
    @total_recaps = ratings.size
  end

  def calculate_ib_interview_summary_metrics(ratings)
    responses = ratings.pluck(:responses).map(&:compact)
    form_context = params[:form_context].to_s.downcase

    if form_context == "interview" && @employee.position_type.name == "Investment Banking"
      deal_question_id = find_question_id("Were you asked about a deal?", form_context)
      trend_question_id = find_question_id("Were you asked about a market trend?", form_context)

      if responses.size > 0
        @asked_deal = calculate_percentage(responses, deal_question_id, "yes")
        @asked_trend = calculate_percentage(responses, trend_question_id, "yes")
      end
    end

    if form_context == "interview" && @employee.position_type.name == "Investment Banking"
      tone_question_id = find_question_id("How would you describe the tone of the interview?", form_context)
      tones = responses.map { |r| r[tone_question_id] }.compact
      @most_common_tones = calculate_common_tones(tones) if tones.any?
    end

    @total_recaps = ratings.size
  end

  def overall_ib_networking_impression(ratings)
    impression_counts = calculate_impression_counts_ib_networking(ratings, "How would you rate your interaction?")
    @impression_data = map_impression_counts(impression_counts)
  end

  def overall_ib_interview_impression(ratings)
    impression_counts = calculate_impression_counts(ratings, "What was your overall impression of the interview?")
    @impression_data = map_impression_counts(impression_counts)
  end

  def recieved_job_offer_ib_interview(ratings)
    offer_counts = calculate_impression_counts(ratings, "Did you receive a job offer?")
    @offer_data = {
      "Received offer" => offer_counts["Yes"] || 0,
      "No offer" => offer_counts["No"] || 0,
      "Waitlisted" => offer_counts["Waitlisted"] || 0,
      "Offer Outcome Pending (at Submission Time)" => offer_counts["Waiting on response"] || 0
    }
  end

  def technical_difficulty_ib_interview(ratings)
    technical_difficulty_counts = calculate_impression_counts(ratings, "How difficult were the technical questions?")
    @technical_difficulty_data = {
      "Very Hard" => technical_difficulty_counts["Very Hard"] || 0,
      "Hard" => technical_difficulty_counts["Hard"] || 0,
      "Medium" => technical_difficulty_counts["Medium"] || 0,
      "Easy" => technical_difficulty_counts["Easy"] || 0
    }
  end

  private

  # Finds a question ID based on text and form context
  def find_question_id(question_text, form_context)
    question_id = FormTemplate.find_by(question_text: question_text, form_context: form_context)&.id.to_s
    Rails.logger.debug "Question Text: #{question_text}, Form Context: #{form_context}, Question ID: #{question_id}"
    question_id
  end

  # Calculates percentage for a specific response
  def calculate_percentage(responses, question_id, expected_value)
    (responses.count { |r| r[question_id] == expected_value } * 100.0 / responses.size).round
  end

  # Calculates the two most common tones
  def calculate_common_tones(tones)
    tone_counts = tones.tally
    tone_counts.sort_by { |_tone, count| -count }.take(2).map do |tone, count|
      [tone, (count * 100.0 / tones.size).round]
    end
  end

  # Calculates impression counts for a specific question
  def calculate_impression_counts_ib_networking(ratings, question_text)
    form_context = "networking"
    question_id = find_question_id(question_text, form_context)
  
    Rails.logger.debug "Question ID for '#{question_text}': #{question_id}"
  
    responses = ratings.pluck(:responses).map { |r| r&.[](question_id) }.compact
    Rails.logger.debug "Filtered Responses for Question ID #{question_id}: #{responses.inspect}"
  
    responses.tally
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
end
