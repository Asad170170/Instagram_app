# frozen_string_literal: true

# UsersController
class UsersController < ApplicationController
  include Searchable

  before_action :authenticate_user!
  before_action :set_profile, only: [:profile]

  def index
    following_ids = Follower.where(follower_id: current_user.id, accepted: [nil, true]).map(&:following_id)
    following_ids << current_user.id
    @follower_suggestions = User.where.not(id: following_ids)
    @posts = Post.includes(:user).where(user_id: following_ids).active
    @stories = Story.includes(:user).where(user_id: following_ids)
    searchable(params)
  end

  def profile
    @posts = @user.posts.active
    @stories = @user.stories
    searchable(params)
  end

  def requests
    req = Follower.where(following_id: current_user.id, accepted: [false]).map(&:follower_id)
    @users = User.where(id: req)
  end

  def requests_accept
    flash[:notice] = 'Request Accepted'
    @req = Follower.find_by(follower_id: params[:follower_id], following_id: current_user.id)
    @req.update(accepted: true)
    redirect_to requests_index_path(current_user.username)
  end

  def requests_decline
    Follower.find_by(follower_id: params[:follower_id], following_id: current_user.id).destroy
    flash[:notice] = 'Request Declined'
    redirect_to requests_index_path(current_user.username)
  end

  def follow_user
    @following_id = params[:follow_id]
    if User.find(@following_id).is_public?
      Follower.create(follower_id: current_user.id, following_id: @following_id, accepted: true)
      flash[:notice] = "You are now following #{User.find(@following_id).username}"
    else
      Follower.create(follower_id: current_user.id, following_id: @following_id, accepted: false)
      flash[:notice] = "Request sent to #{User.find(@following_id).username}"
    end
    redirect_to users_path
  end

  def set_profile
    @user = User.find_by(username: params[:username])
  end

  def story_params
    params.require(:user).permit(:image, :username, :email, :follower_id)
  end
end
