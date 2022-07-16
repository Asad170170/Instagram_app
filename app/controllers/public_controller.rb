# frozen_string_literal: true

class PublicController < ApplicationController


  def homepage
    if current_user
      redirect_to controller: 'users', action: 'index', current_user: current_user
    end
  end

  
end
