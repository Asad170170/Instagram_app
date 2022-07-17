# frozen_string_literal: true

# PostsController
class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, except: :create

  def edit
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.active = true
    @post.user_id = current_user.id if user_signed_in?
    authorize @post
    if @post.save
      flash[:notice] = 'Post has been uploaded successfully..'
      redirect_to users_path
    else
      flash[:alert] = "Post has not been uploaded! images #{@post.errors.messages[:images].first}"
      render new_post_path
    end
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    authorize @post
    if @post.destroy
      flash[:notice] = 'Post has been deleted successfully..'
    else
      flash[:alert] = 'Post is not deleted!'
    end
    redirect_to profile_path(current_user.username)
  end

  def set_post
    @post = Post.find(params[:id]) if params[:id].present?
  end

  def post_params
    params.require(:post).permit(:caption, images: [])
  end
end
