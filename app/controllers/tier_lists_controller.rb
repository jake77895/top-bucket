class TierListsController < ApplicationController
  include TierListsHelper

  # --- SHOW METHOD ---
  def show
    @tier_list = TierList.find(params[:id])
  
    # Fetch ItemRanks and custom values
    @item_custom_values = ItemRank.where(tier_list_id: @tier_list.id)
                              .includes(:item)
                              .map { |rank| { item_id: rank.item_id, custom_values: rank.custom_values } }

  
    @item_ranks = ItemRank.where(tier_list_id: @tier_list.id).includes(:item).order(:id)
    @items = @item_ranks.map(&:item)
  
    if params[:item_id].present?
      @current_item = @items.find { |item| item.id == params[:item_id].to_i }
    else
      @current_item = @items.first
    end

    if @items.present? && @items.any?
      @next_item_id = @items[@items.index(@current_item) + 1]&.id
      @previous_item_id = @items[@items.index(@current_item) - 1]&.id if @items.index(@current_item).positive?
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
      .select('item_id, AVG(rank) as average_rank')
      .map do |rank|
        { 
          item: Item.find(rank.item_id), 
          average_rank: rank.average_rank.round 
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
  
    item_rank = ItemRank.find_or_initialize_by(
      item_id: params[:item_id],
      tier_list_id: @tier_list.id,
    )

    item_rank.user_id = params[:user_id] || current_user&.id
    item_rank.rank = rank_value(params[:item_rank])
  
    if item_rank.save
      next_item_id = next_item_id_after_rank(params[:item_id])
      if next_item_id
        redirect_to tier_list_path(@tier_list, item_id: next_item_id), notice: "Item ranked successfully. Moving to next item."
      else
        redirect_to tier_list_path(@tier_list), notice: "Item ranked successfully. No more items to rank."
      end
    else
      redirect_to tier_list_path(@tier_list), alert: "Failed to rank item."
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
  
    render 'tier_lists/group_rankings'
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

  # --- PARAMS ---
  def rank_item_params
    params.permit(:tier_list_id, :item_id, :item_rank, :user_id)
  end
end
