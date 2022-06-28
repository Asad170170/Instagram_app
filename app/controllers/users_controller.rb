class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_params, only: [:create]


  def index
    @user=current_user
    @posts=Post.active
  end
  def show
    #user profile
    @user=current_user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to controller: 'users', action: 'show', current_user: current_user
    else
      flash.alert("sign up failed !")
    end


  end

  private
  def user_params
    params.require(:user).permit(:email, :body)
  end
end
