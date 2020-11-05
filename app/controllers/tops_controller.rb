class TopsController < ApplicationController
  def index
    @users = User.all
     if user_signed_in?
      @users = User.where.not(id: current_user.id)
     end
  end
  def show
    @user = User.find(params[:id])
  end
end
