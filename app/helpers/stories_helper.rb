# frozen_string_literal: true

module StoriesHelper
  def story_picture(story)
    img_path = story.image.present? ? story.thumbnail : 'heart.png'
    image_tag(img_path, width: 70)
  end

  def story_profile_picture(user)
    img_path = user.image.present? ? user.thumbnail : 'heart.png'
    image_tag(img_path, width: 30, height: 30, class: 'circular_img')
  end

  def set_story_path(story)
    stories_path(id: story.id)
  end
end
