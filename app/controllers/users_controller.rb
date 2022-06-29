class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:profile]

  def index
    @user=current_user
    @posts=Post.active
  end

  def profile
    @posts=@user.posts.active
  end

  def set_profile
    @user=User.find_by_username(params[:username])
  end
end
