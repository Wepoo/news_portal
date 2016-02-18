class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @articles = Article.where(user_id: @user).limit(10)
  end

  def create
    @user = User.create(user_params)
  end

  private

    def user_params
      params.require(:user).permit(:login, :email, :encrypted_password)
    end
end
