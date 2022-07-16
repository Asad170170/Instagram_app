# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show]
  #  after_action :verify_authorized,only: [:new,:edit,:destroy]
  #  after_action :verify_policy_scoped,only: [:new,:edit,:destroy]
  def new
    @post = Post.new
    #  authorize @post
  end

  def show
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id if user_signed_in?
    authorize @post
    if @post.save
      flash[:notice] = "Post has been uploaded successfully.."
      redirect_to users_path
    else
      flash[:notice] = "Post has not been uploaded!"
      render new_post_path
    end
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
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
