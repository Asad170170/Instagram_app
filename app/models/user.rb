class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :posts
  has_one_attached :image
  validate :image_type

  # def thumbnail
  #   return self.image.variant(resize: "300x300!").processed
  # end

  private
  def image_type
    if self.image.attached? == false
      errors.add(:image, "is missing !")
    end
  end
end
