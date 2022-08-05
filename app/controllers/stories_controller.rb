# frozen_string_literal: true

# StoriesController
class StoriesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_story, only: %i[show destroy]
  skip_before_action :verify_authenticity_token

  def create
    @story = Story.new(story_params)
    @story.user_id = current_user.id if user_signed_in?
    authorize @story
    if @story.save
      DeleteStoryJob.perform_at(30.seconds.from_now, @story.id)
      flash[:notice] = 'Story has been uploaded successfully..'
      redirect_to controller: 'users', action: 'index', current_user: current_user
    else
      flash[:alert] = 'Story has not been uploaded!'
      render new_stories_path
    end
  end

  def show

    @image=("https://res.cloudinary.com/dzp8ziraj/image/upload/"+@story.image.key+".jpg")
    @user=@story.user
    if(params[:format])
      respond_to do |format|
        format.json { render json: [@story,@image,@user] }
      end
    end


  end

  def destroy
    # authorize @story
    if @story.destroy
      flash[:notice] = 'Story has been deleted successfully..'
      respond_to do |format|
        format.json { render json: [@story] }
      end
      return
    else
      flash[:alert] = 'Story  has not been deleted!'
    end
    redirect_to controller: 'users', action: 'index', current_user: current_user


  end

  def set_story
    if((params[:format].to_i)!=0)
       @story = Story.find(params[:format])
    else
      @story = Story.find(params[:id])
    end
  end

  def story_params
    params.require(:story).permit(:image) unless params[:story].nil?
  end
end
