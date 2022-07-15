# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :configure_permitted_peremitters,
                if: :devise_controller?
  before_action :set_query



  protected

  def configure_permitted_peremitters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[image username firstname lastname website description is_public])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[image username firstname lastname website description is_public])
  end

  private

  def set_query
    @query = User.ransack(params[:q])
  end

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to request.referer || root_path
  end

  def record_not_found
    flash[:alert] = 'Record not found.'
    redirect_to request.referer || root_path
  end

  def set_search
    @q=Recipe.search(params[:q])
  end
end
