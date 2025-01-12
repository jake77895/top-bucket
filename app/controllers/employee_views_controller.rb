class EmployeeViewsController < ApplicationController
  def summary
    @employee_view = EmployeeView.find(params[:id])
    @employee = Employee.find(params[:employee_id])

    # Filtered Ratings: Using params to dynamically scope
    @filtered_ratings = @employee.ratings
      .where(form_context: params[:form_context].to_s.downcase, position_type: params[:position_type])
      .includes(:user)

    overview_summary # Call the overview_summary method to set variables

    render "employee_views/summary/complete_summary"
  end

  def overview_summary
    @employee_view = EmployeeView.find(params[:id])
    @employee = Employee.find(params[:employee_id])

    # Scoped Ratings: Dynamically filter based on `form_context` and `position_type`
    @filtered_ratings = @employee.ratings
      .where(form_context: params[:form_context].to_s.downcase, employee: @employee)
      .includes(:user)
      .order(created_at: :desc)

    if params[:form_context].to_s.downcase == "networking" && @employee.position_type_id == 2
      calculate_ib_networking_summary_metrics(@filtered_ratings)
      overall_ib_networking_impression(@filtered_ratings)
    end

    if params[:form_context].to_s.downcase == "interview" && @employee.position_type_id == 2
      calculate_ib_interview_summary_metrics(@filtered_ratings)
      overall_ib_interview_impression(@filtered_ratings)
      recieved_job_offer_ib_interview(@filtered_ratings)
      technical_difficulty_ib_interview(@filtered_ratings)
    end
  end

  def show
    @employee_view = EmployeeView.find(params[:id])
    @associated_pages = @employee_view.pages

    # Perform filtering
    filter

    # Fetches the job levels linked to employees in the employee_view, ordered by level_rank descending
    @job_levels = JobLevel
      .joins(:employees)
      .where(employees: { id: @employee_view.employee_ids })
      .distinct
      .order(level_rank: :desc)

    # Fetch employees under "Other" category (without job levels)
    @other_employees = @employee_view.employees.where(job_level_id: nil)

    # Variables for the form and rating components
    @form_context = params[:form_context] || "coffee_chat" # Default form context
    @form_questions = @employee ? load_form_questions(@form_context) : []
    @ratings = @employee ? load_ratings(@form_context) : []
    @rating = Rating.new # Initialize a new rating for the form
  end

  def filter
    # Ensure only permitted parameters are used
    permitted_q = permitted_filter_params

    @q = @employee_view.employees.ransack(permitted_q)
    @filtered_employees = @q.result(distinct: true)

    @job_levels = JobLevel.where(id: @filtered_employees.pluck(:job_level_id).uniq).order(level_rank: :desc)
    @groups = Group.where(id: @filtered_employees.pluck(:group_id).uniq).order(:name)
    @locations = Location.where(id: @filtered_employees.pluck(:location_id).uniq).order(:name)
    @companies = Company.where(id: @filtered_employees.pluck(:company_id).uniq).order(:name)
    @previous_companies = Company.where(id: @filtered_employees.pluck(:previous_company_id).uniq).order(:name)
    @undergraduate_schools = School.where(id: @filtered_employees.pluck(:undergraduate_school_id).uniq).order(:name)
    @graduate_schools = School.where(id: @filtered_employees.pluck(:graduate_school_id).uniq).order(:name)
  end

  def flag_employee
    @employee = Employee.find(params[:id])
    reason = params[:reason]

    # Handle flagging logic, e.g., save to a flags table
    Flag.create!(employee: @employee, reason: reason, flagged_by: current_user)

    redirect_to employee_path(@employee), notice: "Employee has been flagged."
  end

  private

  def set_employee
    @employee = Employee.find(params[:id]) # Find the employee based on the ID
  end

  # Fetches the form questions based on the employee's position type and the form context
  def load_form_questions(form_context)
    FormTemplate.where(
      position_type_id: @employee.position_type_id,
      form_context: form_context,
    )
  end

  # Fetches ratings for the employee filtered by the form context
  def load_ratings(form_context)
    @employee.ratings.includes(:user).where(form_context: form_context)
  end

  def calculate_ib_networking_summary_metrics(ratings)
    responses = ratings.pluck(:responses).map(&:compact)

    # Dynamically find question IDs based on question texts
    if params[:form_context] == "networking" && @employee.position_type_id == 2
      technical_question_id = FormTemplate.find_by(question_text: "Were you asked any technical questions?", form_context: params[:form_context])&.id.to_s
      deal_question_id = FormTemplate.find_by(question_text: "Were you asked about a deal?", form_context: params[:form_context].to_s.downcase)&.id.to_s
      trend_question_id = FormTemplate.find_by(question_text: "Were you asked about a market trend?", form_context: params[:form_context].to_s.downcase)&.id.to_s
      referred_question_id = FormTemplate.find_by(question_text: "Were you referred to another colleague?", form_context: params[:form_context].to_s.downcase)&.id.to_s

      # Calculate percentages dynamically using the question IDs
      @asked_technical = (responses.count { |r| r[technical_question_id] == "yes" } * 100.0 / responses.size).round
      @asked_deal = (responses.count { |r| r[deal_question_id] == "yes" } * 100.0 / responses.size).round
      @asked_trend = (responses.count { |r| r[trend_question_id] == "yes" } * 100.0 / responses.size).round
      @passed_next_round = (responses.count { |r| r[referred_question_id] == "yes" } * 100.0 / responses.size).round
    end

    # Most common tones
    if params[:form_context].to_s.downcase == "networking" && @employee.position_type_id == 2
      tone_question_id = FormTemplate.find_by(question_text: "How would you describe the tone of the conversation?", form_context: params[:form_context].to_s.downcase)&.id.to_s
      tones = responses.map { |r| r[tone_question_id] }.compact
      tone_counts = tones.tally
      @most_common_tones = tone_counts.sort_by { |_tone, count| -count }.take(2).map do |tone, count|
        [tone, (count * 100.0 / tones.size).round]
      end
    end

    # Total recaps
    @total_recaps = ratings.size
  end

  def calculate_ib_interview_summary_metrics(ratings)
    responses = ratings.pluck(:responses).map(&:compact)

    # Dynamically find question IDs based on question texts
    if params[:form_context].to_s.downcase == "interview" && @employee.position_type_id == 2
      deal_question_id = FormTemplate.find_by(question_text: "Were you asked about a deal?", form_context: params[:form_context].to_s.downcase)&.id.to_s
      trend_question_id = FormTemplate.find_by(question_text: "Were you asked about a market trend?", form_context: params[:form_context].to_s.downcase)&.id.to_s

      # Calculate percentages dynamically using the question IDs
      @asked_deal = (responses.count { |r| r[deal_question_id] == "yes" } * 100.0 / responses.size).round
      @asked_trend = (responses.count { |r| r[trend_question_id] == "yes" } * 100.0 / responses.size).round
    end

    # Most common tones
    if params[:form_context].to_s.downcase == "interview" && @employee.position_type_id == 2
      tone_question_id = FormTemplate.find_by(question_text: "How would you describe the tone of the interview?", form_context: params[:form_context].to_s.downcase)&.id.to_s
      tones = responses.map { |r| r[tone_question_id] }.compact
      tone_counts = tones.tally
      @most_common_tones = tone_counts.sort_by { |_tone, count| -count }.take(2).map do |tone, count|
        [tone, (count * 100.0 / tones.size).round]
      end
    end

    # Total recaps
    @total_recaps = ratings.size
  end

  def overall_ib_networking_impression(ratings)
    if params[:form_context].to_s.downcase == "networking" && @employee.position_type_id == 2
      # Fetch the ID dynamically based on the question text
      impression_id = FormTemplate.find_by(question_text: "How would you rate your interaction?", form_context: params[:form_context].to_s.downcase)&.id.to_s

      # Count occurrences of each response for the "How would you rate your interaction?" question
      impression_counts = ratings.pluck(:responses).map { |r| r[impression_id] }.compact.tally

      # Map the counts to predefined categories
      @impression_data = {
        "Very Positive" => impression_counts["Very Positive"] || 0,
        "Positive" => impression_counts["Positive"] || 0,
        "Neutral" => impression_counts["Neutral"] || 0,
        "Negative" => impression_counts["Negative"] || 0,
      }
    end
  end

  def overall_ib_interview_impression(ratings)
    if params[:form_context].to_s.downcase == "interview" && @employee.position_type_id == 2
      # Fetch the ID dynamically based on the question text
      impression_id = FormTemplate.find_by(question_text: "What was your overall impression of the interview?", form_context: params[:form_context].to_s.downcase)&.id.to_s

      # Count occurrences of each response for the "What was your overall impression of the interview?" question
      impression_counts = ratings.pluck(:responses).map { |r| r[impression_id] }.compact.tally

      # Map the counts to predefined categories
      @impression_data = {
        "Positive" => impression_counts["Positive"] || 0,
        "Neutral" => impression_counts["Neutral"] || 0,
        "Negative" => impression_counts["Negative"] || 0,
      }
    end
  end

  def recieved_job_offer_ib_interview(ratings)
    if params[:form_context].to_s.downcase == "interview" && @employee.position_type_id == 2
      # Fetch the ID dynamically based on the question text
      offer_id = FormTemplate.find_by(question_text: "Did you receive a job offer?", form_context: params[:form_context].to_s.downcase)&.id.to_s

      # Count occurrences of each response for the "What was your overall impression of the interview?" question
      offer_counts = ratings.pluck(:responses).map { |r| r[offer_id] }.compact.tally

      # Map the counts to predefined categories
      @offer_data = {
        "Received offer" => offer_counts["Yes"] || 0,
        "No offer" => offer_counts["No"] || 0,
        "Waitlisted" => offer_counts["Waitlisted"] || 0,
        "Offer Outcome Pending (at Submission Time)" => offer_counts["Waiting on response"] || 0,
      }
    end
  end

  def technical_difficulty_ib_interview(ratings)
    if params[:form_context].to_s.downcase == "interview" && @employee.position_type_id == 2
      # Fetch the ID dynamically based on the question text
      technical_difficulty_id = FormTemplate.find_by(question_text: "How difficult were the technical questions?", form_context: params[:form_context].to_s.downcase)&.id.to_s

      # Count occurrences of each response for the "What was your overall impression of the interview?" question
      technical_difficulty_counts = ratings.pluck(:responses).map { |r| r[technical_difficulty_id] }.compact.tally

      # Map the counts to predefined categories
      @technical_difficulty_data = {
        "Very Hard" => technical_difficulty_counts["Very Hard"] || 0,
        "Hard" => technical_difficulty_counts["Hard"] || 0,
        "Medium" => technical_difficulty_counts["Medium"] || 0,
        "Easy" => technical_difficulty_counts["Easy"] || 0,
      }
    end
  end

  def permitted_filter_params
    # Safely permit only allowed `q` parameters
    params.fetch(:q, {}).permit(
      :job_level_id_eq,
      :group_id_eq,
      :location_id_eq,
      :company_id_eq,
      :previous_company_id_eq,
      :undergraduate_school_id_eq,
      :graduate_school_id_eq
    )
  end
end
