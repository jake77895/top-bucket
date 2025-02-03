class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_user, only: [:destroy, :make_admin, :make_interview_coach]

  def index
    @users = User.all.order(created_at: :desc)
  end

  def destroy
    if @user == current_user
      redirect_to admin_users_path, alert: "You cannot delete yourself."
    else
      @user.destroy
      redirect_to admin_users_path, notice: "User deleted successfully."
    end
  end

  def make_admin
    if @user == current_user
      redirect_to admin_users_path, alert: "You cannot change your own role."
    elsif @user.update(admin: true)
      redirect_to admin_users_path, notice: "User is now an admin."
    else
      redirect_to admin_users_path, alert: "Could not update user."
    end
  end

  def make_interview_coach
    if @user == current_user
      redirect_to admin_users_path, alert: "You cannot change your own role."
    elsif @user.update(is_interview_coach: true)
      redirect_to admin_users_path, notice: "User is now an interview coach."
    else
      redirect_to admin_users_path, alert: "Could not update user."
    end
  end

  private

  def authorize_admin!
    redirect_to root_path, alert: 'You are not authorized to access this page.' unless current_user&.admin?
  end

  def set_user
    @user = User.find(params[:id])
  end
end
