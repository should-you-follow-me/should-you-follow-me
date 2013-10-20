class UsersController < ApplicationController
  def show
    twitter_screen_name = params[:id]

    @user = User.where(twitter_screen_name: twitter_screen_name).first

    unless @user
      MetricsWorker.perform_async twitter_screen_name
      render 'analysing'
    end
  end
end
