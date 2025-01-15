class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_forum_room

  def show
    @post = Post.find(params[:id])
    @forum_comments = @post.forum_comments.where(parent_id: nil) # Top-level forum comments only
  end

  def new
    @forum_room = ForumRoom.find(params[:forum_room_id]) # Pass forum_room_id in params
    @post = @forum_room.posts.new
  end

  def create
    @forum_room = ForumRoom.find(params[:post][:forum_room_id])
    @post = @forum_room.posts.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to forum_room_path(@forum_room), notice: 'Post created successfully!'
    else
      render :new, alert: 'Failed to create the post.'
    end
  end

  private

  def set_forum_room
    @forum_room = ForumRoom.find(params[:forum_room_id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :forum_room_id)
  end
end
