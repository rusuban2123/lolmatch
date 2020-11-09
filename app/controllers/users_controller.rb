class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:show]
  def index
    @search_params = user_search_params
    @users = User.search(@search_params)
  end

  def edit
  end

  def update
    if current_user.update(user_params)
       redirect_to root_path
    else
       redirect_to edit_user_path(current_user)
    end
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

  def user_params
    params.require(:user).permit([:teamname, :toprank_id, :jgrank_id, :midrank_id, :suprank_id, :botrank_id, :power_id, :detail, :weekday_id, :stime_id])
  end

  def user_search_params
    params.fetch(:search, {}).permit(:teamname, :power_id_from, :power_id_to, :weekday_id, :stime_id)
  end
end

