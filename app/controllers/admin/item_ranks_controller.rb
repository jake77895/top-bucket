class Admin::ItemRanksController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_tier_list
  before_action :set_item_rank, only: [:edit, :update, :destroy]

  def index
    @item_ranks = @tier_list.item_ranks.includes(:item)
  end

  def new
    @item_rank = @tier_list.item_ranks.build
    @items = Item.all
  end

  def create
    @item_rank = @tier_list.item_ranks.build(item_rank_params)
    if @item_rank.save
      redirect_to admin_tier_list_item_ranks_path(@tier_list), notice: 'Item successfully added to Tier List.'
    else
      @items = Item.all
      render :new
    end
  end

  def edit
    @items = Item.all
  end

  def update
    if @item_rank.update(item_rank_params)
      redirect_to admin_tier_list_item_ranks_path(@tier_list), notice: 'Item association updated successfully.'
    else
      @items = Item.all
      render :edit
    end
  end

  def destroy
    @item_rank.destroy
    redirect_to admin_tier_list_item_ranks_path(@tier_list), notice: 'Item removed from Tier List.'
  end

  private

  def set_tier_list
    @tier_list = TierList.find(params[:tier_list_id])
  end

  def set_item_rank
    @item_rank = @tier_list.item_ranks.find(params[:id])
  end

  def item_rank_params
    params.require(:item_rank).permit(:item_id, custom_values: {})
  end

  def authorize_admin!
    redirect_to root_path, alert: 'You are not authorized to access this page.' unless current_user&.admin?
  end
end
