# Login/logout
class SessionsController < ApplicationController
  def new
    redirect_to current_user if logged_in?
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      flash[:success] = 'You have successfully logged in!'
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
