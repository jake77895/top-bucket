class Admin::ExitOpportunityDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_detail, only: [:edit, :update, :destroy]

  def index
    @mappings = ExitOpportunityMapping.includes(:exit_opportunity_details)
                                     .order(created_at: :desc)

    render 'admin/exit_opportunities_details/index'
  end

  def new
    @detail = ExitOpportunityDetail.new
    @mapping = ExitOpportunityMapping.find(params[:mapping_id]) if params[:mapping_id]
  end

  def create
    @detail = ExitOpportunityDetail.new(detail_params)
    if @detail.save
      redirect_to admin_exit_opportunity_details_path, 
                  notice: 'Exit opportunity detail was successfully created.'
    else
      @mappings = ExitOpportunityMapping.includes(:exit_opportunity_details)
                                       .order(created_at: :desc)
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    render 'admin/exit_opportunities_details/edit'
  end

  def update
    if @detail.update(detail_params)
      redirect_to admin_exit_opportunity_details_path, 
                  notice: 'Exit opportunity detail was successfully updated.'
    else
      @mappings = ExitOpportunityMapping.includes(:exit_opportunity_details)
                                       .order(created_at: :desc)
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @detail.destroy
    redirect_to admin_exit_opportunity_details_path, 
                notice: 'Exit opportunity detail was successfully deleted.'
  end

  private

  def set_detail
    @detail = ExitOpportunityDetail.find(params[:id])
  end

  def detail_params
    params.require(:exit_opportunity_detail).permit(
      :exit_opportunity_mapping_id,
      :target_company_name,
      :target_group,
      :source_company_name,
      :source_group,
      :likelihood
    )
  end
end
