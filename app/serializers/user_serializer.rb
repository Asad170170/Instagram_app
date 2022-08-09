class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :image ,:email
  def image
    "https://res.cloudinary.com/dzp8ziraj/image/upload/"+object.image.key+".jpg"
  end
end
