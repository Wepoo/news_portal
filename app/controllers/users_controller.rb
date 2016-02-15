class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def create
    @user = User.create(user_params)
  end

  private

    def user_params
      params.require(:user).permit(:login, :email, :encrypted_password)
    end
end
