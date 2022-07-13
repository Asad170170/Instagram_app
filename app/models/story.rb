# frozen_string_literal: true

class Story < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  validate :image_type

  def thumbnail
    self.image.variant(resize: '70x70!').processed
  end

  def thumbnailvs
    self.image.variant(resize: '30x30!').processed
  end

  def thumbnailLarge
    image.variant(resize: '500x500!').processed
  end

  private

  def image_type
    errors.add(:image, 'is missing !') if image.attached? == false
  end
end
