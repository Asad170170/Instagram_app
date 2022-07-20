# frozen_string_literal: true

# Searchable
module Searchable
  extend ActiveSupport::Concern

  def searchable(params)
    return unless params[:commit] && params[:q][:username_i_cont_any] != ''

    @query = User.ransack(params[:q])
    @items = @query.result(distinct: true)
  end
end
