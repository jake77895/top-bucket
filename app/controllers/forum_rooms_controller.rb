class ForumRoomsController < ApplicationController
  def index
    @forum_rooms = ForumRoom.all
  end

  def show
    @forum_room = ForumRoom.find(params[:id])
    @posts = @forum_room.posts
  end
end
