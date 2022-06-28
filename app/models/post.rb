class Post < ApplicationRecord
  # belongs_to :user
  has_many_attached :images
  before_create :set_active


  scope :active, -> {where active:true}

  def thumbnail index
    return self.images[index].variant(resize: "300x300!").processed
  end

  private
  def image_type
    if images.attached? == false
      errors.add(:images, "are missing !")
    end
    images.each do |img|
      if !img.content_type.in?(%('image/jpeg image/png'))
        errors.add(:images, "need to be a jpeg or png file")
      end
    end
  end

  def set_active
    self.active=true
  end
end
