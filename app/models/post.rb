class Post < ApplicationRecord
  # belongs_to :user
  default_scope {order(created_at: :desc)}
  has_many_attached :images
  has_many :likes
  has_many :comments
  before_create :set_active
  belongs_to :user
  validate :image_type


  scope :active, -> {where active:true}

  def thumbnail index
    return self.images[index].variant(resize: "521x500!").processed
  end

  def thumbnailSMALL index
    return self.images[index].variant(resize: "300x300!").processed
  end

  def total_likes
    0
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
    if images.length > 10
      byebug
      errors.add(:images, "can't be more than 10!")
    end
  end
  def set_active
    self.active=true
  end
end
