# frozen_string_literal: true

# Comment
class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :comment, presence: true
  validates :post_id, presence: true
  validates :user_id, presence: true
  after_create :update_post_comments_counter
  after_destroy :update_post_likes_counter_decrement

  attr_accessor :return_to

  private

  def update_post_comments_counter
    Post.find(post_id).increment(:total_comments_count).save
  end

  def update_post_likes_counter_decrement
    Post.find(post_id).decrement(:total_comments_count).save
  end
end
