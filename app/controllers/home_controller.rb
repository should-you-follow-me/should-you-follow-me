class HomeController < ApplicationController
  def index
  end

  def search
    redirect_to user_url(params[:username])
  end
end
