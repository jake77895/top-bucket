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
    @recap_card_data = recap_card_logic_ib_networking

  end

  private

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
    def recap_card_logic_ib_networking
      # Fetch a random employee
      @employee = fetch_random_employee_with_ratings
      Rails.logger.debug "Selected Employee: #{@employee.inspect}"
      return nil unless @employee
    
      # Load ratings for the employee
      ratings = load_ratings("networking")
      Rails.logger.debug "Loaded Ratings: #{ratings.size}"
      return nil if ratings.empty?
    
      # Fetch networking metrics
      calculate_ib_networking_summary_metrics(ratings)
      Rails.logger.debug "Metrics: Technical=#{@asked_technical}, Deal=#{@asked_deal}, Trend=#{@asked_trend}"
    
      # Fetch overall impressions
      overall_ib_networking_impression(ratings)
      Rails.logger.debug "Overall Impression Data: #{@impression_data.inspect}"
    
      # Calculate positive percentage
      impression_counts = calculate_impression_counts_ib_networking(ratings, "How would you rate your interaction?")
      Rails.logger.debug "Impression Counts: #{impression_counts.inspect}"
    
      positive_percentage = calculate_positive_impressions_percentage_ib_networking(impression_counts)
      Rails.logger.debug "Positive Percentage: #{positive_percentage}"
    
      # Build recap card data
      {
        name: @employee.name,
        company: fetch_company(@employee),
        level: fetch_level(@employee),
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
  
    # Fetch a random employee with at least 10 ratings
    def fetch_random_employee_with_ratings
      Employee
        .joins(:ratings) # Join with ratings
        .group('employees.id') # Group by employee ID
        .having('COUNT(ratings.id) >= 10') # At least 10 ratings
        .order('RANDOM()') # Random order
        .first
    end
  
    # Fetch employee position (modify as per your schema)
    def fetch_company(employee)
      employee.company&.name || "Unknown Company"
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
  
    

end
