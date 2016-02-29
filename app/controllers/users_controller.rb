class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy, :finish_signup]

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

  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    # authorize! :update, @user 
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        @user.skip_reconfirmation!
        sign_in(@user, :bypass => true)
        redirect_to @user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  # DELETE /users/:id.:format
  def destroy
    # authorize! :delete, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      accessible = [ :name, :email, :tag_list ] # extend with your own params
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end
end
