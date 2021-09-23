class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You in dawg"
      redirect_to root_path
    else
      flash.now[:error] = "Yo info ain't correct"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "you out mayn"
    redirect_to login_path
  end
end
