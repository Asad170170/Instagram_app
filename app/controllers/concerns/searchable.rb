module Searchable

  extend ActiveSupport::Concern

  
  def Searchable(params)
    if params[:commit] && params[:q][:username_i_cont_any]!=""
      @query = User.ransack(params[:q])
      @items = @query.result(distinct: true)
    end
  end

end
