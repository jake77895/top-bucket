class Admin::PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

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

  private

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
