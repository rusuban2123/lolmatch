class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
     redirect_to user_session_path
    else
     render 'new'
    end
  end

private

  def tweet_params
    params.require(:tweet).permit(:toprank_id, :jgrank_id, :midrank_id, :suprank_id, :botrank_id, :detail, :teamname, :starttime, :endtime, :weekday_id).merge(user_id: current_user.id)
  end

end