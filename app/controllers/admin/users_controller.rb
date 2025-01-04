class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  def index
    @users = User.all.order(created_at: :desc)
  end

  def destroy
    @user = User.find(params[:id])
    if @user == current_user
      redirect_to admin_users_path, alert: "You cannot delete yourself."
    else
      @user.destroy
      redirect_to admin_users_path, notice: "User deleted successfully."
    end
  end

  private

  def authorize_admin!
    redirect_to root_path, alert: 'You are not authorized to access this page.' unless current_user&.admin?
  end

end
