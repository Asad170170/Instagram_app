# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :stories, dependent: :delete_all
  has_one_attached :image
  validate :image_type
  validates :username , presence: true ,length: { maximum: 20 }
  validates :firstname , presence: true ,length: { maximum: 10 }
  validates :lastname , presence: true ,length: { maximum: 10 }
  # has_many :followers

  def thumbnail
    image.variant(resize: '50x50!').processed
  end

  def thumbnailcomment
    image.variant(resize: '30x30!').processed
  end

  def full_name
    "#{firstname} #{lastname}"
  end

  def total_followers
    Follower.where(follower_id: id).count
  end

  def total_following
    Follower.where(following_id: id).count
  end

  private

  def image_type
    errors.add(:image, 'is missing !') if image.attached? == false
  end
end
