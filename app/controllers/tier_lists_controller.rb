class TierListsController < ApplicationController
  include TierListsHelper

  def show
    @tier_list = TierList.find(params[:id])
    @item_custom_values = ItemRank.where(tier_list_id: @tier_list.id).includes(:item).map do |rank|
      { item_id: rank.item_id, custom_values: rank.custom_values }
    end

    @item_ranks = ItemRank.where(tier_list_id: @tier_list.id).includes(:item).order(:id)
    @items = @item_ranks.map(&:item)

    if params[:item_id].present?
      @current_item = @items.find { |item| item.id == params[:item_id].to_i }
    else
      @current_item = @items.first
    end

    @next_item_id = @items[@items.index(@current_item) + 1]&.id
    @previous_item_id = @items[@items.index(@current_item) - 1]&.id if @items.index(@current_item).positive?
  end


  def rank_item
    @tier_list = TierList.find(params[:tier_list_id])
  
    item_rank = ItemRank.find_or_initialize_by(
      item_id: params[:item_id],
      tier_list_id: @tier_list.id
    )
  
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
  

  private

  def next_item_id_after_rank(current_item_id)
    item_ids = @tier_list.items.pluck(:id)
    current_index = item_ids.index(current_item_id.to_i)

    return nil if current_index.nil? # Handle edge case if the item is not found

    # Check if there's a next item
    next_index = current_index + 1
    next_index < item_ids.length ? item_ids[next_index] : nil
  end
  
  
end
