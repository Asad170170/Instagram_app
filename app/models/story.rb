class Story < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  validate :image_type

  def thumbnail
    return self.image.variant(resize: "70x70!").processed
  end

  def thumbnailvs
    return self.image.variant(resize: "30x30!").processed
  end

  def thumbnailLarge
    return self.image.variant(resize: "500x500!").processed
  end
  private
  def image_type
    if self.image.attached? == false
      errors.add(:image, "is missing !")
    end
  end
end
