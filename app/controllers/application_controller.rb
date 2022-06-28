# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_peremitters,
        if: :devise_controller?

          protected
          def configure_permitted_peremitters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:image])
            devise_parameter_sanitizer.permit(:account_update, keys: [:image])
          end

end
