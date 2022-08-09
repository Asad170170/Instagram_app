class StorySerializer < ActiveModel::Serializer
  attributes :id ,:image
  belongs_to :user
  def image
    "https://res.cloudinary.com/dzp8ziraj/image/upload/"+object.image.key+".jpg"
  end

end
