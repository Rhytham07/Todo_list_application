class UsersController < ApplicationController
   before_action :set_user, only: [:show,  :update, :destroy]
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.error
    end

  end

  def update
    @user.update(user_params)
    render json: @user
  end

  def destroy
    @user.tasks.destroy_all if @user.tasks.any? 
    @user.destroy
    render json: { message: "User successfully destroyed" }
  end

  def show
    render json: @user
  end

  def index
    @users = User.all
    render json: @users
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:email, :full_name, :user_type)
  end
end