# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show]
  def new
    @post = Post.new
  end

  def show
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id if user_signed_in?

    if @post.save

      redirect_to users_path, flash: { success: 'post created' }
    else
      redirect_to new_post_path, flash: { danger: 'post not created' }
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to profile_path(current_user.username)
  end

  def set_post
    @post = Post.find(params[:id]) if params[:id].present?
  end

  def post_params
    params.require(:post).permit(:caption, images: [])
  end
end
