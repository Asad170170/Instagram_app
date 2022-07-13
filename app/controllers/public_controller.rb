# frozen_string_literal: true

class PublicController < ApplicationController
  def homepage
    if current_user
      # flash.alert = 'sign in successful'
      # redirect_to controller: 'users', action: 'show',:id => current_user.id ,  current_user: current_user
      redirect_to controller: 'users', action: 'index', current_user: current_user
    end
  end
end
