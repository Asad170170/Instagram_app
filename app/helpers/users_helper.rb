module UsersHelper

  def profile_picture user
    img_path = user.image.present? ? user.thumbnail : "heart.png"
    image_tag(img_path,width:50,class:"circular_img")
  end

  def set_profile_path user
    username = user.username.present? ? user.username : "xyz"
    profile_path(username)
  end

  def can_edit_profile profile_id
    user_signed_in? && current_user.id==profile_id
  end

end
