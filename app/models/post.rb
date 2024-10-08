# frozen_string_literal: true

# post
class Post < ApplicationRecord
  # belongs_to :user
  default_scope { order(created_at: :desc) }
  has_many_attached :images
  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  belongs_to :user
  validate :image_type

  scope :active, -> { where active: true }

  def thumbnail(index)
    images[index].variant(resize: '521x500!').processed
  end

  def thumbnail_small(index)
    images[index].variant(resize: '300x300!').processed
  end

  private

  def image_type
    errors.add(:images, 'are missing !') if images.attached? == false
    images.each do |img|
      errors.add(:images, 'need to be a jpeg or png file') unless img.content_type.in?(%('image/jpeg image/png'))
    end
    errors.add(:images, "can't be more than 10!") if images.length > 10
  end
end
