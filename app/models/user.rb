class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts , dependent: :delete_all
  has_many :likes , dependent: :delete_all
  has_many :comments , dependent: :delete_all
  has_many :stories , dependent: :delete_all
  has_one_attached :image 
  validate :image_type
  # has_many :followers

  def thumbnail
    return self.image.variant(resize: "50x50!").processed
  end

  def thumbnailcomment
    return self.image.variant(resize: "30x30!").processed
  end

  def full_name
    "#{firstname} #{lastname}"
  end
  def total_followers
    Follower.where(follower_id: self.id).count
  end
  def total_following
    Follower.where(following_id: self.id).count
  end
  private
  def image_type
    if self.image.attached? == false
      errors.add(:image, "is missing !")
    end
  end
end
