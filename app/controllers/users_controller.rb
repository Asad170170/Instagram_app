class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:profile]

  def index
    @user=current_user
    @posts=Post.active

    following_ids=Follower.where(follower_id: current_user.id).map(&:following_id)
    following_ids << current_user.id
    @follower_suggestions=User.where.not(id: following_ids)

  end

  def profile
    @posts=@user.posts.active
  end

  def follow_user
    @follower_id= params[:follow_id]
    if Follower.create(follower_id: current_user.id,following_id:@follower_id)
      redirect_to users_path, flash: {success: "you are now following"}
    else
      redirect_to users_path, flash: {danger: "unable to follow"}
    end
  end

  def set_profile
    @user=User.find_by_username(params[:username])
  end
end
