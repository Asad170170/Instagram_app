# frozen_string_literal: true

# story
class Story < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  validate :image_type

  def thumbnail
    image.variant(resize: '70x70!').processed
  end

  def thumbnailvs
    image.variant(resize: '30x30!').processed
  end

  def thumbnail_large
    image.variant(resize: '500x500!').processed
  end

  private

  def image_type
    errors.add(:image, 'is missing !') if image.attached? == false
  end
end
