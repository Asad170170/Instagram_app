class  StoriesController <ApplicationController
  before_action :authenticate_user!
  before_action :set_story,only: [:show]
  def new
    @story=Story.new
  end
  def show

  end
  def create
    @story=Story.new(story_params)
    @story.user_id=current_user.id if user_signed_in?

    if @story.save

      redirect_to users_path ,flash: { success: "story created"}
    else
      redirect_to new_post_path,flash: { danger:"story not created"}
    end
  end

  def set_story
    @story=Story.find(params[:format])if params[:format].present?
  end

  def story_params
    params.require(:story).permit(:image)
  end

end
