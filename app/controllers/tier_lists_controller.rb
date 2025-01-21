class TierListsController < ApplicationController
  helper_method :rank_value

  def index
    @tier_lists = TierList.all.order(:category, :name)
  end

  # --- SHOW METHOD ---
  def show
    @tier_list = TierList.find(params[:id])

    # Fetch unique items associated with the tier list
    @items = Item.joins(:item_ranks)
                 .where(item_ranks: { tier_list_id: @tier_list.id })
                 .distinct
                 .order(:id)

    # Fetch ItemRanks and map to custom values
    @item_custom_values = ItemRank.where(tier_list_id: @tier_list.id)
                                  .includes(:item)
                                  .map { |rank| { item_id: rank.item_id, custom_values: rank.custom_values } }

    # Fetch item ranks for the current user
    @item_ranks = ItemRank.where(tier_list_id: @tier_list.id, user_id: current_user.id)
                          .index_by(&:item_id) # Index ranks by item_id for efficient lookup

    # Combine items with their rank and custom values
    @items_with_ranks = @items.map do |item|
      {
        item: item,
        item_rank: @item_ranks[item.id], # Pass the full ItemRank object
        custom_values: @item_custom_values.find { |cv| cv[:item_id] == item.id }&.dig(:custom_values),
      }
    end

    Rails.logger.info "@items_with_ranks: #{@items_with_ranks.inspect}"

    # Determine the current item
    if params[:item_id].present?
      @current_item = @items.find { |item| item.id == params[:item_id].to_i }
    else
      @current_item = @items.first
    end

    # Determine next and previous items for navigation
    if @current_item
      current_index = @items.index(@current_item)
      @next_item_id = @items[current_index + 1]&.id if current_index < @items.size - 1
      @previous_item_id = @items[current_index - 1]&.id if current_index.positive?
    end

    render "tier_lists/individual_view/show"
  end

  # --- SHOW GROUP ---
  def show_group
    @tier_list = TierList.find(params[:id])
    @comments = @tier_list.comments.includes(:user).order(created_at: :desc)

    @group_rankings = ItemRank
      .where(tier_list_id: @tier_list.id)
      .group(:item_id)
      .select("item_id, AVG(rank) as average_rank")
      .map do |rank|
      {
        item: Item.find(rank.item_id),
        average_rank: rank.average_rank.round,
      }
    end

    @item_custom_values = ItemRank
      .where(tier_list_id: @tier_list.id)
      .select(:item_id, :custom_values)
      .map { |ir| { item_id: ir.item_id, custom_values: ir.custom_values } }

    # Count unique users who have ranked items in this tier list
    @user_ranking_count = ItemRank.where(tier_list_id: @tier_list.id).distinct.count(:user_id)

    render "tier_lists/group_view/show_group"
  end

  # --- RANK ITEM ---
  def rank_item
    @tier_list = TierList.find(params[:tier_list_id])

    Rails.logger.info "Parameters received: #{params.inspect}"

    # Strong parameters to ensure item_rank is allowed
    permitted_params = params.permit(:tier_list_id, :item_id, :user_id, :item_rank)
    Rails.logger.info "Permitted parameters: #{permitted_params.inspect}"

    # Find or initialize the item rank for the current user
    item_rank = ItemRank.find_or_initialize_by(
      item_id: permitted_params[:item_id],
      tier_list_id: permitted_params[:tier_list_id],
      user_id: permitted_params[:user_id],
    )

    # Parse rank using the rank_value helper
    # Update the rank value
    rank = rank_value(rank_item_params[:item_rank])
    Rails.logger.info "Resolved rank value: #{rank.inspect}"
    item_rank.rank = rank

    if item_rank.save
      Rails.logger.info "After save: #{item_rank.reload.inspect}"
      redirect_to tier_list_path(@tier_list, item_id: rank_item_params[:item_id]), notice: "Item ranked successfully."
    else
      redirect_to tier_list_path(@tier_list, item_id: rank_item_params[:item_id]), alert: "Failed to rank item: #{item_rank.errors.full_messages.to_sentence}"
    end
  end

  # --- USER RANKINGS ---
  def user_rankings
    @tier_list = TierList.find(params[:id])
    @user_ranks = ItemRank.where(tier_list_id: @tier_list.id, user_id: current_user.id).includes(:item).order(:rank)
    @ranked_items = @user_ranks.map(&:item)
  end

  # --- GROUP RANKINGS ---
  def group_rankings
    @tier_list = TierList.find(params[:id])

    @group_rankings = @tier_list.items.map do |item|
      average_rank = ItemRank.where(item_id: item.id, tier_list_id: @tier_list.id)
                             .average(:rank)
      { item: item, average_rank: average_rank&.ceil || "N/A" }
    end

    render "tier_lists/group_rankings"
  end

  private

  # --- NAVIGATE TO NEXT ITEM ---
  def next_item_id_after_rank(current_item_id)
    item_ids = @tier_list.items.order(:id).pluck(:id)
    current_index = item_ids.index(current_item_id.to_i)
    return nil if current_index.nil?
    next_index = current_index + 1
    next_index < item_ids.length ? item_ids[next_index] : nil
  end

  # --- RANK VALUE HELPERS ---
  def rank_value(rank_param)
    rank_param.to_i.clamp(1, 6) # Ensures the rank is between 1 and 6
  end

  # --- RANK VALUE MAPPING ---
  def rank_value(rank)
    return nil unless rank.is_a?(String)

    mapping = {
      "S" => 1,
      "A" => 2,
      "B" => 3,
      "C" => 4,
      "D" => 5,
      "F" => 6,
    }

    normalized_rank = rank.upcase
    result = mapping[normalized_rank]
    Rails.logger.info "Mapping for '#{rank}' (normalized: '#{normalized_rank}'): #{result.inspect}"
    result || nil # Return nil if the rank is invalid
  end

  # --- PARAMS ---
  def rank_item_params
    params.permit(:tier_list_id, :item_id, :item_rank, :user_id)
  end
end
