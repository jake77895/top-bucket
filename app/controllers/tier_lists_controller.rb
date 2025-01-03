class TierListsController < ApplicationController
  def show
    @tier_list = TierList.find(params[:id])
  end
end
