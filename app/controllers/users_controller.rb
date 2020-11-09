class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:show]
  def index
    @search_params = user_search_params
    @users = User.search(@search_params)
  end

  def show
    @user=User.find(params[:id])
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
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

  private

  def user_search_params
    params.fetch(:search, {}).permit(:teamname, :power_id_from, :power_id_to, :weekday_id, :stime_id)
  end
end

