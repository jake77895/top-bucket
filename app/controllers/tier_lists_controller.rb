class TierListsController < ApplicationController
  def show
    @tier_list = TierList.find(params[:id])
    @items = @tier_list.items.includes(:picture_attachment)
    @item_custom_values = ItemRank.where(tier_list_id: @tier_list.id).includes(:item).map do |rank|
      { item_id: rank.item_id, custom_values: rank.custom_values }
    end
  end
end
