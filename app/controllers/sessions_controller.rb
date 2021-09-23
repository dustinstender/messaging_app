class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:sessions][:username])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      flash[:success] = "You in dawg"
      redirect_to root_path
    else
      flash.now[:error] = "Yo info ain't correct"
      render 'new'
    end
  end
end
