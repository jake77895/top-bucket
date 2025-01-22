class SiteController < ApplicationController
  helper_method :shorten_name

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

end
