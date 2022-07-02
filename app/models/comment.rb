class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates_presence_of :comment
  validates_presence_of :post_id
  validates_presence_of :user_id
  after_create :update_post_comments_counter

  attr_accessor :return_to

  private
  def update_post_comments_counter
    Post.find(self.post_id).increment(:total_comments_count).save
  end
end
