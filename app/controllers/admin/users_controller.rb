class Admin::UsersController < ApplicationController
  before_action :check_role
  def index
    # @verified = User.verified_users
    # @unverified = User.unverified_users
    @users = User.users_status
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to admin_users_path, notice: "User has been created."
    else
      flash.now[:alert] = "Cannot create user. Something went wrong."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      redirect_to admin_user_path(user), notice: "User has been updated."
    else
      flash.now[:alert] = "Cannot update user. Something went wrong."
      render :update, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role, :balance, :verified)
  end

  def check_role
    unless current_user.role
      redirect_to landing_page_path, alert: "Unauthorized access"
    end
  end
end
