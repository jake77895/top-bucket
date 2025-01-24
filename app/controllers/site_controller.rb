class SiteController < ApplicationController
  helper_method :shorten_name
  include EmployeeRecapOverviewStats

  def home
  end

  def about
  end

  def contact
  end

  def mock_home

    # Ratings section of home view
    tb_ratings
    bb_ratings

    # Forum section of home view
    top_forum_posts

    # Fetch the data for the recap card
    recap_mock_display



  end



  private

  def recap_mock_display
    # Initialize an empty array to track used employee IDs
    used_employee_ids = []

    # Generate multiple recap cards for networking
    @recap_card_data_networking = Array.new(2) do
      employee = fetch_random_employee_with_ratings(used_employee_ids)
      if employee
        used_employee_ids << employee.id
        recap_card_logic_ib_networking(employee)
      end
    end.compact

    # Generate multiple recap cards for interviews
    @recap_card_data_interview = Array.new(1) do
      employee = fetch_random_employee_with_ratings(used_employee_ids)
      if employee
        used_employee_ids << employee.id
        recap_card_logic_ib_interview(employee)
      end
    end.compact

  end
  

  # In your controller (e.g., HomeController or ForumRoomsController)
  def top_forum_posts
    @top_posts = Post
      .joins(:forum_comments) # Join with comments to count them
      .where('posts.created_at >= ?', 2.weeks.ago) # Filter posts created in the past 2 weeks
      .group('posts.id') # Group by post ID to aggregate comments
      .select('posts.*, COUNT(forum_comments.id) AS comments_count') # Select posts and count comments
      .order('comments_count DESC') # Order by most comments
      .limit(4) # Limit to 4 posts
  end




  def tb_ratings
    
    # Fetch random tier lists to display on the home view
    random_tier_list_ids = TierList.order("RANDOM()").limit(3).pluck(:id) # Example: 3 random tier lists
  
    # Count unique user rankings for each tier list
    @user_ranking_counts_tb = ItemRank
      .where(tier_list_id: random_tier_list_ids)
      .group(:tier_list_id)
      .select("tier_list_id, COUNT(DISTINCT user_id) as user_count")
      .map { |record| [record.tier_list_id, record.user_count] }
      .to_h
  
    # Fetch group rankings for items with an average rank of 1 or 2 within these tier lists
    @group_rankings_tb = ItemRank
      .where(tier_list_id: random_tier_list_ids)
      .group(:item_id, :tier_list_id)
      .select("item_id, tier_list_id, AVG(rank) as average_rank")
      .having("AVG(rank) <= 2")
      .order("RANDOM()")
      .limit(6)

  end

  def bb_ratings
    
    # Fetch random tier lists to display on the home view
    random_tier_list_ids = TierList.order("RANDOM()").limit(3).pluck(:id) # Example: 3 random tier lists
  
    # Count unique user rankings for each tier list
    @user_ranking_counts_bb = ItemRank
      .where(tier_list_id: random_tier_list_ids)
      .group(:tier_list_id)
      .select("tier_list_id, COUNT(DISTINCT user_id) as user_count")
      .map { |record| [record.tier_list_id, record.user_count] }
      .to_h
  
    # Fetch group rankings for items with an average rank of 1 or 2 within these tier lists
    @group_rankings_bb = ItemRank
      .where(tier_list_id: random_tier_list_ids)
      .group(:item_id, :tier_list_id)
      .select("item_id, tier_list_id, AVG(rank) as average_rank")
      .having("AVG(rank) >= 5")
      .order("RANDOM()")
      .limit(6)

  end


  # Helper method to shorten tier list names
  def shorten_name(name)
    name_mapping = {
      "Investment Banking" => "IB",
      "Venture Capital" => "VC",
      "Private Equity" => "PE",
      "Hedge Fund" => "HF",
      "Corporate Development" => "CD"
    }

    # Replace matching parts of the name
    name_mapping.each do |long_name, short_name|
      name = name.gsub(long_name, short_name)
    end
    name
  end

  # Main logic for recap card
  def recap_card_logic_ib_networking(employee)
    Rails.logger.debug "Selected Employee: #{employee.inspect}"
    
    # Load ratings for the employee
    ratings = load_ratings_for_employee(employee, "networking")
    Rails.logger.debug "Loaded Ratings: #{ratings.size}"
    return nil if ratings.empty?
    
    # Fetch networking metrics
    calculate_ib_networking_summary_metrics(employee, ratings)
    Rails.logger.debug "Metrics: Technical=#{@asked_technical}, Deal=#{@asked_deal}, Trend=#{@asked_trend}"
    
    # Fetch overall impressions
    overall_ib_networking_impression(employee, ratings) # Pass both arguments
    Rails.logger.debug "Overall Impression Data: #{@impression_data.inspect}"
    
    # Calculate positive percentage
    impression_counts = calculate_impression_counts(ratings, "How would you rate your interaction?", "networking")
    positive_percentage = calculate_positive_impressions_percentage_ib_networking(impression_counts)
    Rails.logger.debug "Positive Percentage: #{positive_percentage}"
    
    # Build recap card data
    {
      name: employee.name,
      employee_id: employee.id, # Include employee ID
      position: fetch_position(employee),
      company: fetch_company(employee),
      level: fetch_level(employee),
      recaps: @total_recaps,
      positive_percentage: positive_percentage,
      tag: "Networking",
      market_trend: @asked_trend,
      deal: @asked_deal,
      technical: @asked_technical,
      most_common_tones: @most_common_tones,
      overall_impression: @impression_data
    }
  end
  
  def recap_card_logic_ib_interview(employee)
    Rails.logger.debug "Selected Employee: #{employee.inspect}"
    
    # Load ratings for the employee specific to "interview" context
    ratings = load_ratings_for_employee(employee, "interview")
    Rails.logger.debug "Loaded Ratings: #{ratings.size}"
    return nil if ratings.empty?
    
    # Fetch interview metrics
    calculate_ib_interview_summary_metrics(employee, ratings)
    Rails.logger.debug "Metrics: Deal=#{@asked_deal}, Trend=#{@asked_trend}"
    
    # Fetch overall impressions
    overall_ib_interview_impression(employee, ratings)
    Rails.logger.debug "Overall Impression Data: #{@impression_data.inspect}"
    
    # Calculate positive impressions percentage
    impression_counts = calculate_impression_counts(
      ratings, 
      "What was your overall impression of the interview?", 
      "interview"
    )
    positive_percentage = calculate_positive_impressions_percentage_ib_networking(impression_counts) # Reusing networking method
    
    difficulty_counts = calculate_impression_counts(
      ratings, 
      "How difficult were the technical questions?", 
      "interview"
    )
    technical_percentage = calculate_hard_technical_questions_percentage_ib_interview(difficulty_counts)
    
    # Build recap card data
    {
      name: employee.name,
      employee_id: employee.id,
      position: fetch_position(employee),
      company: fetch_company(employee),
      level: fetch_level(employee),
      recaps: @total_recaps,
      positive_percentage: positive_percentage,
      tag: "Interview",
      market_trend: @asked_trend,
      deal: @asked_deal,
      technical: technical_percentage,
      most_common_tones: @most_common_tones,
      overall_impression: @impression_data
    }
  end
  

  # Fetch a random employee with at least 10 ratings
  def fetch_random_employee_with_ratings(excluded_employee_ids = [])
    employee = Employee
      .joins(:ratings)
      .where.not(id: excluded_employee_ids) # Exclude already-used employees
      .group('employees.id')
      .having('COUNT(ratings.id) >= 10')
      .order('RANDOM()')
      .first
  
    Rails.logger.debug "Fetched Employee: #{employee.inspect}"
    employee
  end

  # Fetch employee position (modify as per your schema)
  def fetch_company(employee)
    employee.company&.name || "Unknown Company"
  end

  # Fetch employee position (modify as per your schema)
  def fetch_position(employee)
    employee.position_type&.name || "Unknown Company"
  end

  # Fetch employee position (modify as per your schema)
  def fetch_level(employee)
    employee.job_level&.name || ""
  end

  # Calculate positive or very positive percentage
  def calculate_positive_percentage(employee)
    total = employee.ratings.count
    positive = employee.ratings.where(form_context: %w[Positive Very Positive]).count
    total.zero? ? 0 : (positive.to_f / total * 100).round
  end



  def load_ratings_for_employee(employee, form_context)
    employee.ratings.includes(:user).where(form_context: form_context)
  end

    

end
