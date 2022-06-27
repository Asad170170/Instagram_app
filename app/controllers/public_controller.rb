class PublicController < ApplicationController

  def homepage
    if current_user
      flash.alert = 'Model deleted successfully'
      redirect_to  posts_path
    end
  end
end
