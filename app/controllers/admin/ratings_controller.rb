class Admin::RatingsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_rating, only: [:destroy]

  # Admin index view for ratings
  def index
    @ratings = Rating.includes(:user, :employee).order(created_at: :desc)
  end

  # Delete a rating
  def destroy
    @rating.destroy
    redirect_to admin_ratings_path, notice: "Rating deleted successfully."
  end

  private

  def set_rating
    @rating = Rating.find(params[:id])
  end
end
