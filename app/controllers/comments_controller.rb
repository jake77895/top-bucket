class CommentsController < ApplicationController
  before_action :authenticate_user! # Ensure only logged-in users can comment

  # POST /comments

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
  
    # Handle commentable_type dynamically
    if params[:comment][:commentable_id].blank?
      @comment.commentable_type = nil
      @comment.commentable_id = nil
    else
      @comment.commentable_type = "Item"
    end
  
    if @comment.save
      redirect_back fallback_location: root_path, notice: "Comment added successfully!"
    else
      redirect_back fallback_location: root_path, alert: @comment.errors.full_messages.to_sentence
    end
  end


  # DELETE /comments/:id
  def destroy
    @comment = Comment.find(params[:id])

    if @comment.user == current_user || current_user.admin?
      @comment.destroy
      redirect_back fallback_location: root_path, notice: "Comment deleted successfully!"
    else
      redirect_back fallback_location: root_path, alert: "You are not authorized to delete this comment."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :tier_list_id, :commentable_id, :commentable_type)
  end
end
