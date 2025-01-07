class Admin::LocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_location, only: [:edit, :update, :destroy]

  def index
    @locations = Location.all.order(:name)
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to admin_locations_path, notice: 'Location created successfully.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @location.update(location_params)
      redirect_to admin_locations_path, notice: 'Location updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to admin_locations_path, alert: 'Location deleted.'
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name)
  end
end
