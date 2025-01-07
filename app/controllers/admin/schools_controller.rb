class Admin::SchoolsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_school, only: [:edit, :update, :destroy]

  # List all schools
  def index
    @schools = School.all.order(:name)
  end

  # Display form for new school
  def new
    @school = School.new
  end

  # Create a new school
  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to admin_schools_path, notice: 'School created successfully.'
    else
      render :new
    end
  end

  # Edit existing school
  def edit; end

  # Update school
  def update
    if @school.update(school_params)
      redirect_to admin_schools_path, notice: 'School updated successfully.'
    else
      render :edit
    end
  end

  # Delete school
  def destroy
    @school.destroy
    redirect_to admin_schools_path, alert: 'School deleted.'
  end

  private

  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:name)
  end
end
