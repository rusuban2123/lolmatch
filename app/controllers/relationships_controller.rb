class RelationshipsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def follow
    current_user.follow(params[:id])
    redirect_to relationship_path(current_user.id)
  end

  def unfollow
    current_user.unfollow(params[:id])
    redirect_to relationship_path(current_user.id)
  end

  before_action :authenticate_user!, only: [:show]
  def index
    @users = User.all
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
end
