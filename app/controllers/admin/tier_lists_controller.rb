class Admin::TierListsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_tier_list, only: [:edit, :update, :destroy, :show, :add_items, :associate_items, :publish]

  # Publish Action
  def publish
    if @tier_list.update(published: true)
      redirect_to admin_tier_lists_path, notice: 'Tier List successfully published.'
    else
      redirect_to admin_tier_lists_path, alert: 'Failed to publish the Tier List.'
    end
  end

  # Show available items to associate with the Tier List
  def add_items
    @items = Item.all
  end

  # Associate selected items with the Tier List
  def associate_items
    item_ids = params[:item_ids] || []
    item_ids.each do |item_id|
      @tier_list.item_ranks.find_or_create_by(item_id: item_id) do |item_rank|
        item_rank.custom_values = @tier_list.custom_fields.index_with { |_field| '' }
      end
    end
    redirect_to admin_tier_list_item_ranks_path(@tier_list), notice: 'Items successfully added to the Tier List.'
  end

  def index
    @tier_lists = TierList.order(updated_at: :desc)
  end

  def new
    @tier_list = TierList.new
    @templates = TierListTemplate.all
  end

  def create
    template_id = params[:tier_list].delete(:tier_list_template_id)
    @tier_list = TierList.new(tier_list_params)
  
    if template_id.present?
      template = TierListTemplate.find_by(id: template_id)
      @tier_list.custom_fields = template.custom_fields if template
    end
  
    if @tier_list.save
      redirect_to admin_tier_lists_path, notice: 'Tier List was successfully created.'
    else
      @templates = TierListTemplate.all
      Rails.logger.debug @tier_list.errors.full_messages # Log validation errors
      render :new
    end
  end


  def edit
    @templates = TierListTemplate.all
  end

  def update
    if @tier_list.update(tier_list_params)
      redirect_to admin_tier_lists_path, notice: 'Tier List was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @tier_list.destroy
    redirect_to admin_tier_lists_path, notice: 'Tier List was successfully deleted.'
  end

  private

  def set_tier_list
    @tier_list = TierList.find(params[:id])
  end
  
  def tier_list_params
    params.require(:tier_list).permit(
      :name, 
      :description, 
      :published, 
      custom_fields: [:name, :type, :value]
    )
  end

  def authorize_admin!
    redirect_to root_path, alert: 'You are not authorized to access this page.' unless current_user&.admin?
  end
end
