# frozen_string_literal: true

class Post < ApplicationRecord
  # belongs_to :user
  default_scope { order(created_at: :desc) }
  has_many_attached :images
  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  before_create :set_active
  belongs_to :user
  validate :image_type

  scope :active, -> { where active: true }

  def thumbnail(index)
    images[index].variant(resize: '521x500!').processed
  end

  def thumbnailSMALL(index)
    images[index].variant(resize: '300x300!').processed
  end

  # def total_likes
  #   0
  # end

  private

  def image_type
    errors.add(:images, 'are missing !') if images.attached? == false
    images.each do |img|
      errors.add(:images, 'need to be a jpeg or png file') unless img.content_type.in?(%('image/jpeg image/png'))
    end
    errors.add(:images, "can't be more than 10!") if images.length > 10
  end

  def set_active
    self.active = true
  end
end
