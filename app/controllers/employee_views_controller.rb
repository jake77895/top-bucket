class EmployeeViewsController < ApplicationController
  def index
    @employee_views = EmployeeView
    .left_joins(:employees)
    .select('employee_views.*, COUNT(employees.id) AS employee_count')
    .group('employee_views.id')
    .order(created_at: :desc)

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
    # Ensure only permitted parameters are used
    permitted_q = permitted_filter_params
  
    # Initialize the Ransack object
    @q = @employee_view.employees.ransack(permitted_q)
  
    # Apply filters dynamically
    query = @q.result(distinct: true)
  
    # Cache filtered employees in a variable
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
      :graduate_school_id_eq
    )
  end

  def flag_params
    params.require(:flag).permit(:reason, :text)
  end

end
