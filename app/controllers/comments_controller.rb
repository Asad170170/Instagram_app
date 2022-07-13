# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    if @comment.save!
      return_url = params[:comment][:return_to].present? ? post_path(@comment.post_id) : users_path
      redirect_to return_url, flash: { success: 'comment posted.' }
    else
      redirect_to users_path, flash: { danger: 'comment was not posted! ' }
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@comment.post)
  end

  def comment_params
    params.require(:comment).permit(:comment, :post_id, :user_id, :return_to)
  end
end
