class Admin::CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_company, only: [:edit, :update, :destroy]

  def index
    @companies = Company.all.order(:name)
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to admin_companies_path, notice: 'Company created successfully.'
    else
      Rails.logger.debug @company.errors.full_messages
      flash.now[:alert] = 'Failed to create company.'
      render :new
    end
  end

  def edit; end

  def update
    if @company.update(company_params)
      redirect_to admin_companies_path, notice: 'Company updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @company.destroy
    redirect_to admin_companies_path, alert: 'Company deleted.'
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :position_type_id)
  end
end
