class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id]) 
    @teamname = @user.teamname
    @toprank_id = @user.toprank_id
    @jgrank_id = @user.jgrank_id
    @midrank_id = @user.midrank_id
    @suprank_id = @user.suprank_id
    @weekday_id = @user.weekday_id
    @starttime = @user.starttime
    @endtime = @user.endtime
    @detail = @user.detail
  end
end