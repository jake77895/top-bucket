class ForumCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @post = Post.find(params[:post_id])
    @forum_comment = @post.forum_comments.new(forum_comment_params)
    @forum_comment.user = current_user
    @forum_comment.parent_id = params[:forum_comment][:parent_id] if params[:forum_comment][:parent_id].present?

    if @forum_comment.save
      redirect_to post_path(@post), notice: 'Comment added successfully.'
    else
      redirect_to post_path(@post), alert: 'Failed to add comment.'
    end
  end

  def destroy
    @forum_comment = ForumComment.find(params[:id])
    if @forum_comment.user == current_user
      @forum_comment.destroy
      redirect_to post_path(@forum_comment.post), notice: 'Comment deleted successfully.'
    else
      redirect_to post_path(@forum_comment.post), alert: 'You can only delete your own comments.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def forum_comment_params
    params.require(:forum_comment).permit(:body, :parent_id)
  end
end
