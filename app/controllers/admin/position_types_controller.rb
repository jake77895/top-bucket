class Admin::PositionTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_position_type, only: [:edit, :update, :destroy]

  # Display all position types
  def index
    @position_types = PositionType.all.order(:name)
  end

  # Display the form to create a new position type
  def new
    @position_type = PositionType.new
  end

  # Create a new position type
  def create
    @position_type = PositionType.new(position_type_params)
    if @position_type.save
      redirect_to admin_position_types_path, notice: 'Position Type created successfully.'
    else
      render :new
    end
  end

  # Display the form to edit an existing position type
  def edit; end

  # Update an existing position type
  def update
    if @position_type.update(position_type_params)
      redirect_to admin_position_types_path, notice: 'Position Type updated successfully.'
    else
      render :edit
    end
  end

  # Delete an existing position type
  def destroy
    @position_type.destroy
    redirect_to admin_position_types_path, alert: 'Position Type deleted.'
  end

  private

  # Set the position type instance variable
  def set_position_type
    @position_type = PositionType.find(params[:id])
  end

  # Strong parameters for position type
  def position_type_params
    params.require(:position_type).permit(:name)
  end
end
