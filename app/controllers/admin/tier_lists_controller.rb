class Admin::TierListsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_tier_list, only: [:edit, :update, :destroy, :show]

  def index
    @tier_lists = TierList.order(updated_at: :desc)
  end

  def new
    @tier_list = TierList.new
    @templates = TierListTemplate.all
  end

  def create
    @tier_list = TierList.new(tier_list_params)
  
    if params[:tier_list][:tier_list_template_id].present?
      template = TierListTemplate.find(params[:tier_list][:tier_list_template_id])
      @tier_list.custom_fields = template.custom_fields
    end
  
    if @tier_list.save
      redirect_to admin_tier_lists_path, notice: 'Tier List was successfully created.'
    else
      @templates = TierListTemplate.all
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
      :name, :description, :published,
      custom_fields: [:name, :type, :value]
    )
  end

  def authorize_admin!
    redirect_to root_path, alert: 'You are not authorized to access this page.' unless current_user&.admin?
  end
end
