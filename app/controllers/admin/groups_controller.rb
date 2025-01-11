class Admin::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_group, only: [:edit, :update, :destroy]

  ## =====================
  ## INDEX VIEW
  ## =====================
  def index
    @groups = Group.includes(:company, :location)
                   .order('company_id NULLS LAST', 'location_id NULLS LAST', 'position_type_id NULLS LAST', 'name ASC')
  end

  ## =====================
  ## NEW ACTION
  ## =====================
  def new
    @group = Group.new
    @companies = Company.all
    @locations = Location.all
    @position_types = PositionType.all
  end
  

  ## =====================
  ## CREATE ACTION
  ## =====================
  def create
    company_id = params[:group][:company_id].presence
    location_id = params[:group][:location_id].presence
    position_type_id = params[:group][:position_type_id].presence
    position_type_default = params[:group][:position_type_default] == '1'
    group_names = params[:groups]
  
    if group_names.present?
      group_names.each do |group|
        Group.create(
          name: group[:name],
          company_id: company_id,
          location_id: location_id,
          position_type_id: position_type_id,
          position_type_default: position_type_default
        )
      end
      redirect_to admin_groups_path, notice: 'Groups created successfully.'
    else
      @companies = Company.all
      @locations = Location.all
      @position_types = PositionType.all
      flash[:alert] = 'Please ensure Group Names are properly filled out.'
      render :new
    end
  end
  
  

  ## =====================
  ## EDIT ACTION
  ## =====================
  def edit
    @companies = Company.all
    @locations = Location.all
  end

  ## =====================
  ## UPDATE ACTION
  ## =====================
  def update
    if @group.update(group_params)
      redirect_to admin_groups_path, notice: 'Group updated successfully.'
    else
      @companies = Company.all
      @locations = Location.all
      flash[:alert] = 'Failed to update group. Please check your inputs.'
      render :edit
    end
  end

  ## =====================
  ## DELETE ACTION
  ## =====================
  def destroy
    @group.destroy
    redirect_to admin_groups_path, alert: 'Group deleted successfully.'
  end

  private

  ## =====================
  ## SETTERS & PERMITTED PARAMS
  ## =====================
  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :company_id, :location_id)
  end
end
