class Admin::TierListTemplatesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  before_action :set_template, only: [:edit, :update, :destroy]

  def index
    @templates = TierListTemplate.all
  end

  def new
    @template = TierListTemplate.new
  end

  def create
    @template = TierListTemplate.new(tier_list_template_params)
    @template.creator = current_user

    if @template.save
      redirect_to admin_tier_list_templates_path, notice: 'Template created successfully.'
    else
      render :new, status: :unprocessable_entity
    end

    Rails.logger.debug "DEBUGGED PARAMS: #{params[:tier_list_template][:custom_fields].inspect}"

  end

  def edit; end

  def update
    if @template.update(tier_list_template_params)
      redirect_to admin_tier_list_templates_path, notice: 'Template updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end

    Rails.logger.debug "DEBUGGED PARAMS: #{params[:tier_list_template][:custom_fields].inspect}"
  end

  def destroy
    @template.destroy
    redirect_to admin_tier_list_templates_path, notice: 'Template deleted successfully.'
  end

  private

  def authorize_admin
    redirect_to root_path, alert: 'You are not authorized to access this page.' unless current_user.admin?
  end

  def set_template
    @template = TierListTemplate.find(params[:id])
  end

  def tier_list_template_params
    params.require(:tier_list_template).permit(
      :name,
      :short_description,
      custom_fields: [:name, :type]
    )
  end
  
end
