class Admin::ForumRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :find_forum_room, only: [:edit, :update, :destroy]

  # List all forum rooms
  def index
    @forum_rooms = ForumRoom.all
  end

  # Display form for creating a new forum room
  def new
    @forum_room = ForumRoom.new
  end

  # Handle forum room creation
  def create
    @forum_room = ForumRoom.new(forum_room_params)
    if @forum_room.save
      redirect_to admin_forum_rooms_path, notice: "Forum room created successfully."
    else
      render :new, alert: "Failed to create forum room."
    end
  end

  # Display form for editing a forum room
  def edit
    @forum_room = ForumRoom.find(params[:id])
  end

  # Handle forum room updates
  def update
    if @forum_room.update(forum_room_params)
      redirect_to admin_forum_rooms_path, notice: "Forum room updated successfully."
    else
      render :edit, alert: "Failed to update forum room."
    end
  end

  # Handle forum room deletion
  def destroy
    @forum_room.destroy
    redirect_to admin_forum_rooms_path, notice: "Forum room deleted successfully."
  end

  private

  # Strong parameters
  def forum_room_params
    params.require(:forum_room).permit(:name, :description)
  end

  # Find the forum room by ID
  def find_forum_room
    @forum_room = ForumRoom.find(params[:id])
  end

  # Ensure the user is an admin
  def ensure_admin!
    redirect_to root_path, alert: "Access denied." unless current_user.admin?
  end
end
