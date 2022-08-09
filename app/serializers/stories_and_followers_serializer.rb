class StoriesAndFollowersSerializer < ActiveModel::Serializer
  attributes :stories ,:followers
  def initialize(stories, followers)
    @stories = stories
    @followers = followers
  end
end
