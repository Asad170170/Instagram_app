# frozen_string_literal: true

class StoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_story, only: [:show]
  def new
    @story = Story.new
  end

  def show;
  end

  def create
    @story = Story.new(story_params)
    @story.user_id = current_user.id if user_signed_in?
    authorize @story
    if @story.save
      DeleteStoryJob.perform_at(1.minute.from_now, @story.id)
      redirect_to users_path, flash: { success: 'story created' }
    else
      redirect_to new_post_path, flash: { danger: 'story not created' }
    end
  end

  def destroy

    @story = Story.find(params[:format])
    #authorize @story
    @story.destroy
    redirect_to controller: 'users', action: 'index', current_user: current_user
    # redirect_to profile_path(current_user.username)
  end

  def set_story
    @story = Story.find(params[:format]) if params[:format].present?
  end

  def story_params
    params.require(:story).permit(:image)
  end
end
