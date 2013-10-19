class UsersController < ApplicationController
  def show
    @user = User.where(twitter_screen_name: params[:id]).first
  end
end
