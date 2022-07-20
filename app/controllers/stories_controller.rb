# frozen_string_literal: true

# StoriesController
class StoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_story, only: %i[show destroy]

  def create
    @story = Story.new(story_params)
    @story.user_id = current_user.id if user_signed_in?
    authorize @story
    if @story.save
      DeleteStoryJob.perform_at(30.seconds.from_now, @story.id)
      flash[:notice] = 'Story has been uploaded successfully..'
      redirect_to users_path
    else
      flash[:alert] = 'Story has not been uploaded!'
      render new_stories_path
    end
  end

  def destroy
    authorize @story
    if @story.destroy
      flash[:notice] = 'Story has been deleted successfully..'
    else
      flash[:alert] = 'Story  has not been deleted!'
    end
    redirect_to controller: 'users', action: 'index', current_user: current_user
  end

  def set_story
    @story = Story.find(params[:format]) if params[:format].present?
  end

  def story_params
    params.require(:story).permit(:image) unless params[:story].nil?
  end
end
