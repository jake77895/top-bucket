class Admin::PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  before_action :set_page, only: [:manage_tier_lists, :update_tier_list_associations]

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    @page.created_by = current_user.id

    if @page.save
      redirect_to admin_pages_path, notice: "Page created successfully."
    else
      render :new, alert: "Failed to create page."
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update(page_params)
      redirect_to admin_pages_path, notice: "Page updated successfully."
    else
      render :edit, alert: "Failed to update page."
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to admin_pages_path, notice: "Page deleted successfully."
  end

  def manage_tier_lists
    @tier_lists = TierList.where(published: true)
    @associated_tier_lists = @page.tier_lists
  end

  def update_tier_list_associations
    selected_tier_list_ids = params.dig(:page, :tier_list_ids) || []
  
    # Ensure selected_tier_list_ids is always an array
    selected_tier_list_ids = Array(selected_tier_list_ids)
  
    # Remove unselected associations
    @page.page_associations.where.not(tier_list_id: selected_tier_list_ids).destroy_all
  
    # Add new associations
    selected_tier_list_ids.each do |tier_list_id|
      @page.page_associations.find_or_create_by(tier_list_id: tier_list_id)
    end
  
    redirect_to admin_pages_path, notice: 'Tier List associations updated successfully.'
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end

  def authorize_admin
    redirect_to root_path, alert: "You are not authorized to view this page." unless current_user.admin?
  end

  def page_params
    params.require(:page).permit(
      :name, 
      :parent_id, 
      :category, 
      :short_description, 
      :about, 
      :cover_image, 
      :profile_image
    )
  end
end
