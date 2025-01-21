class SiteController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end

  def mock_home

    ratings

  end

  private

  def ratings
    # Fetch random tier lists to display on the home view
    random_tier_list_ids = TierList.order("RANDOM()").limit(3).pluck(:id) # Example: 3 random tier lists
  
    # Count unique user rankings for each tier list
    @user_ranking_counts = ItemRank
      .where(tier_list_id: random_tier_list_ids)
      .group(:tier_list_id)
      .select("tier_list_id, COUNT(DISTINCT user_id) as user_count")
      .map { |record| [record.tier_list_id, record.user_count] }
      .to_h
  
    # Fetch group rankings for items with an average rank of 1 or 2 within these tier lists
    @group_rankings = ItemRank
      .where(tier_list_id: random_tier_list_ids)
      .group(:item_id, :tier_list_id)
      .select("item_id, tier_list_id, AVG(rank) as average_rank")
      .having("AVG(rank) <= 2")
      .order("RANDOM()")
      .limit(6)
  end

end
