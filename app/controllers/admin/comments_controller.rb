class Admin::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @comments = Comment.includes(:user).order(created_at: :desc)
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to admin_comments_path, notice: "Comment deleted successfully."
    else
      redirect_to admin_comments_path, alert: "Failed to delete comment."
    end
  end

  private

  def require_admin
    redirect_to root_path, alert: "You are not authorized to access this page." unless current_user.admin?
  end
end
