class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "You have successfully logged in!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
  end
end
