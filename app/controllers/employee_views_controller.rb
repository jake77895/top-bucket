class EmployeeViewsController < ApplicationController
  def index
    @employee_views = EmployeeView
      .left_joins(:employees)
      .select('employee_views.*, COUNT(employees.id) AS employee_count')
      .group('employee_views.id')
      .order(name: :asc)
  end
  
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



    if params[:form_context].to_s.downcase == "networking" && @employee.position_type.name == "Investment Banking" 
      calculate_ib_networking_summary_metrics(@filtered_ratings)
      overall_ib_networking_impression(@filtered_ratings)

    end

    if params[:form_context].to_s.downcase == "interview" && @employee.position_type.name == "Investment Banking" 
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
    # @job_levels = JobLevel
    #   .joins(:employees)
    #   .where(employees: { id: @employee_view.employee_ids })
    #   .distinct
    #   .order(level_rank: :desc)

    # Dynamically find the `position_type_id` if filtering is required
    if params[:position_type_name].present?
      position_type_id = PositionType.find_by(name: params[:position_type_name])&.id
    else
      position_type_id = nil
    end

    # Filter job levels
    @job_levels = JobLevel
      .joins(:employees)
      .where(employees: { id: @filtered_employees.pluck(:id) })
      .then { |query| position_type_id ? query.where(position_type_id: position_type_id) : query } # Apply filter dynamically
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

  # def filter
  #   # Ensure only permitted parameters are used
  #   permitted_q = permitted_filter_params

  #   @q = @employee_view.employees.ransack(permitted_q)
  #   @filtered_employees = @q.result(distinct: true)

  #   @job_levels = JobLevel.where(id: @filtered_employees.pluck(:job_level_id).uniq).order(level_rank: :desc)
  #   @groups = Group.where(id: @filtered_employees.pluck(:group_id).uniq).order(:name)
  #   @locations = Location.where(id: @filtered_employees.pluck(:location_id).uniq).order(:name)
  #   @companies = Company.where(id: @filtered_employees.pluck(:company_id).uniq).order(:name)
  #   @previous_companies = Company.where(id: @filtered_employees.pluck(:previous_company_id).uniq).order(:name)
  #   @undergraduate_schools = School.where(id: @filtered_employees.pluck(:undergraduate_school_id).uniq).order(:name)
  #   @graduate_schools = School.where(id: @filtered_employees.pluck(:graduate_school_id).uniq).order(:name)
  # end

  def filter
    # Safely extract permitted parameters
    permitted_q = permitted_filter_params
  
    # Handle group name filtering
    if params.dig(:q, :group_name_eq_any).present?
      group_names = params[:q][:group_name_eq_any]
      group_ids = Group.where(name: group_names).pluck(:id)
  
      # Merge group_id_in into the permitted_q hash while keeping other filters
      permitted_q = permitted_q.merge(group_id_in: group_ids)
    end
  
    # Handle job level name filtering
    if params.dig(:q, :job_level_name_eq_any).present?
      level_names = params[:q][:job_level_name_eq_any]
      level_ids = JobLevel.where(name: level_names).pluck(:id)
  
      # Merge job_level_id_in into the permitted_q hash while keeping other filters
      permitted_q = permitted_q.merge(job_level_id_in: level_ids)
    end
  
    # Initialize the Ransack object
    @q = @employee_view.employees.ransack(permitted_q)
  
    # Apply all filters dynamically
    query = @q.result(distinct: true)
  
    # Cache filtered employees
    @filtered_employees = query
  
    # Fetch related filter data with optimized queries
    @job_levels = JobLevel.joins(:employees)
                          .where(employees: { id: @filtered_employees.pluck(:id) })
                          .distinct
                          .order(:level_rank)
  
    @groups = Group.joins(:employees)
                   .where(employees: { id: @filtered_employees.pluck(:id) })
                   .distinct
                   .order(:name)
  
    @locations = Location.joins(:employees)
                         .where(employees: { id: @filtered_employees.pluck(:id) })
                         .distinct
                         .order(:name)
  
    @companies = Company.joins(:employees)
                        .where(employees: { id: @filtered_employees.pluck(:id) })
                        .distinct
                        .order(:name)
  
    @previous_companies = Company.joins(:employees)
                                 .where(employees: { id: @filtered_employees.pluck(:id) })
                                 .distinct
                                 .order(:name)
  
    @undergraduate_schools = School.joins("INNER JOIN employees ON employees.undergraduate_school_id = schools.id")
                                    .where(employees: { id: @filtered_employees.pluck(:id) })
                                    .distinct
                                    .order(:name)
  
    @graduate_schools = School.joins("INNER JOIN employees ON employees.graduate_school_id = schools.id")
                               .where(employees: { id: @filtered_employees.pluck(:id) })
                               .distinct
                               .order(:name)
  end
  
  
  
  
  

  def flag
    @employee_view = EmployeeView.find(params[:id])
    @employee = Employee.find(params[:employee_id])
    @flag = Flag.new(
      flaggable: @employee,
      user_id: current_user.id,
      reason: params[:flag][:reason], # Reason from the dropdown
      text: params[:flag][:text],     # Text from the text area
      status: "pending"
    )
  
    if @flag.save
      flash[:notice] = "Thank you for submitting. We will look into this issue and update accordingly."
      redirect_to employee_view_path(@employee_view)
    else
      flash[:alert] = "Could not submit the flag. Please try again."
      redirect_back fallback_location: employee_view_path(@employee_view)
    end
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
    if params[:form_context] == "networking" && @employee.position_type.name == "Investment Banking" 
      technical_question_id = FormTemplate.find_by(question_text: "Were you asked any technical questions?", form_context: params[:form_context])&.id.to_s
      deal_question_id = FormTemplate.find_by(question_text: "Were you asked about a deal?", form_context: params[:form_context].to_s.downcase)&.id.to_s
      trend_question_id = FormTemplate.find_by(question_text: "Were you asked about a market trend?", form_context: params[:form_context].to_s.downcase)&.id.to_s
      referred_question_id = FormTemplate.find_by(question_text: "Were you referred to another colleague?", form_context: params[:form_context].to_s.downcase)&.id.to_s

      # Calculate percentages dynamically using the question IDs
      if responses.size > 0
        @asked_technical = (responses.count { |r| r[technical_question_id] == "yes" } * 100.0 / responses.size).round
        @asked_deal = (responses.count { |r| r[deal_question_id] == "yes" } * 100.0 / responses.size).round
        @asked_trend = (responses.count { |r| r[trend_question_id] == "yes" } * 100.0 / responses.size).round
        @passed_next_round = (responses.count { |r| r[referred_question_id] == "yes" } * 100.0 / responses.size).round
      end
    end

    # Most common tones
    if params[:form_context].to_s.downcase == "networking" && @employee.position_type.name == "Investment Banking" 
      tone_question_id = FormTemplate.find_by(question_text: "How would you describe the tone of the conversation?", form_context: params[:form_context].to_s.downcase)&.id.to_s
      tones = responses.map { |r| r[tone_question_id] }.compact
      tone_counts = tones.tally
      if responses.size > 0
        @most_common_tones = tone_counts.sort_by { |_tone, count| -count }.take(2).map do |tone, count|
          [tone, (count * 100.0 / tones.size).round]
        end
      end
    end

    # Total recaps
    @total_recaps = ratings.size
  end

  def calculate_ib_interview_summary_metrics(ratings)
    responses = ratings.pluck(:responses).map(&:compact)

    # Dynamically find question IDs based on question texts
    if params[:form_context].to_s.downcase == "interview" && @employee.position_type.name == "Investment Banking" 
      deal_question_id = FormTemplate.find_by(question_text: "Were you asked about a deal?", form_context: params[:form_context].to_s.downcase)&.id.to_s
      trend_question_id = FormTemplate.find_by(question_text: "Were you asked about a market trend?", form_context: params[:form_context].to_s.downcase)&.id.to_s

      # Calculate percentages dynamically using the question IDs
      if responses.size > 0
        @asked_deal = (responses.count { |r| r[deal_question_id] == "yes" } * 100.0 / responses.size).round
        @asked_trend = (responses.count { |r| r[trend_question_id] == "yes" } * 100.0 / responses.size).round
      end
    end

    # Most common tones
    if params[:form_context].to_s.downcase == "interview" && @employee.position_type.name == "Investment Banking" 
      tone_question_id = FormTemplate.find_by(question_text: "How would you describe the tone of the interview?", form_context: params[:form_context].to_s.downcase)&.id.to_s
      tones = responses.map { |r| r[tone_question_id] }.compact
      tone_counts = tones.tally
      if responses.size > 0
        @most_common_tones = tone_counts.sort_by { |_tone, count| -count }.take(2).map do |tone, count|
          [tone, (count * 100.0 / tones.size).round]
        end
      end
    end

    # Total recaps
    @total_recaps = ratings.size
  end

  def overall_ib_networking_impression(ratings)
    if params[:form_context].to_s.downcase == "networking" && @employee.position_type.name == "Investment Banking" 
      # Fetch the ID dynamically based on the question text
      impression_id = FormTemplate.find_by(question_text: "When was your last interaction in the recruiting process?", form_context: params[:form_context].to_s.downcase)&.id.to_s

      # Count occurrences of each response for the "When was your last interaction in the recruiting process?" question
      impression_counts = ratings.pluck(:responses).map { |r| r[impression_id] }.compact.tally

      # Map the counts to the new categories
      @impression_data = {
        "Early in the process" => impression_counts["Early in the process"] || 0,
        "Middle of the process" => impression_counts["Middle of the process"] || 0,
        "Near the interview stage" => impression_counts["Near the interview stage"] || 0,
        "Don't remember" => impression_counts["Don't remember"] || 0
      }
    end
  end

  def overall_ib_interview_impression(ratings)
    if params[:form_context].to_s.downcase == "interview" && @employee.position_type.name == "Investment Banking" 
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
    if params[:form_context].to_s.downcase == "interview" && @employee.position_type.name == "Investment Banking" 
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
    if params[:form_context].to_s.downcase == "interview" && @employee.position_type.name == "Investment Banking" 
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
      :graduate_school_id_eq,
      :group_name_eq_any, # Custom filter by group name
      :job_level_name_eq_any, 
      group_id_in: [],
      job_level_id_in: []
    )
  end

  def flag_params
    params.require(:flag).permit(:reason, :text)
  end

end
