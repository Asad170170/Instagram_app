class Like <ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates_uniqueness_of :post_id, scope: :user_id
  after_create :update_post_likes_counter

  private
  def update_post_likes_counter
    Post.find(self.post_id).increment(:total_likes_count).save
  end
end
