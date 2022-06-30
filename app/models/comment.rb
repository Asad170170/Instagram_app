class Comment < ApplicationRecord
  belongs_to :Post
  belongs_to :User
  validates_presence_of :user_id
  validates_presence_of :post_id

end
