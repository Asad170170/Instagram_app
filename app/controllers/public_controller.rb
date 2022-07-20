# frozen_string_literal: true

# PublicController
class PublicController < ApplicationController
  def homepage
    redirect_to controller: 'users', action: 'index', current_user: current_user if current_user
  end
end
