# frozen_string_literal: true

# like
class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates_uniqueness_of :post_id, scope: :user_id
  after_create :update_post_likes_counter_increment
  before_destroy :update_post_likes_counter_decrement

  private

  def update_post_likes_counter_increment
    Post.find(post_id).increment(:total_likes_count).save
  end

  def update_post_likes_counter_decrement
    Post.find(post_id).decrement(:total_likes_count).save
  end
end
