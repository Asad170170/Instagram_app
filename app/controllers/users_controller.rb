# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:profile]

  def index
    @user = current_user

    @comment = Comment.new

    following_ids = Follower.where(follower_id: current_user.id).map(&:following_id)
    following_ids << current_user.id
    @follower_suggestions = User.where.not(id: following_ids)
    @posts = Post.includes(:user).where(user_id: following_ids).active
    @stories = Story.includes(:user).where(user_id: following_ids)
    # @seached=params[:q][:username_i_cont_any]
    @items = []
    if params[:commit] && params[:q][:username_i_cont_any]!=""
      @query = User.ransack(params[:q])
      @items = @query.result(distinct: true)
    end

  end

  def profile
    @posts = @user.posts.active
    @stories = @user.stories

    @items = []
    if params[:commit] && params[:q][:username_i_cont_any]!=""
      @query = User.ransack(params[:q])
      @items = @query.result(distinct: true)
    end

  end

  def follow_user
    @follower_id = params[:follow_id]
    if Follower.create(follower_id: current_user.id, following_id: @follower_id)
      redirect_to users_path, flash: { success: 'you are now following' }
    else
      redirect_to users_path, flash: { danger: 'unable to follow' }
    end
  end

  def set_profile
    @user = User.find_by_username(params[:username])
  end

  def story_params
    params.require(:user).permit(:image, :username, :email)
  end
end
