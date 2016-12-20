# User
class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]

  def new
    build_user
  end

  def create
    build_user
    if @user.save
      log_in @user
      flash[:success] = 'You have successfully signed up!'
      redirect_to @user
    else
      render :new
    end
  end

  def show
    find_user
  end

  private

  def user_params
    params.fetch(:user, {}).permit(:name,
                                   :email,
                                   :password,
                                   :password_confirmation)
  end

  def find_user
    @user ||= users_scope.find(params[:id])
  end

  def build_user
    @user ||= users_scope.build
    @user.attributes = user_params
  end

  def users_scope
    User.all
  end
end
