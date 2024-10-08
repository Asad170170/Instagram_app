# frozen_string_literal: true

# LikesController
class LikesController < ApplicationController
  before_action :authenticate_user!

  def save_like
    @like = Like.new(post_id: params[:post_id], user_id: current_user.id)
    @post_id = params[:post_id]
    existing_like = Like.where(post_id: @post_id, user_id: current_user.id)
    respond_to do |format|
      format.js do
        if existing_like.any?
          existing_like.first.destroy
          @success = false
        elsif @like.save
          @success = true
        else
          @success = false
        end
        @post_likes = Post.find(@post_id).total_likes_count
        Rails.logger.debug @post_likes
      end
    end
  end
end
