# frozen_string_literal: true

# search controller
class SearchController < ApplicationController
  def index
    @query = User.ransack(params[:q])
    @items = @query.result(distinct: true)
  end

end
