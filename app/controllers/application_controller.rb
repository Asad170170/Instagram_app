# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_peremitters,
        if: :devise_controller?

          protected
          def configure_permitted_peremitters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:image,:username,:firstname,:lastname,:website,:description,:is_public])
            devise_parameter_sanitizer.permit(:account_update, keys: [:image,:username,:firstname,:lastname,:website,:description,:is_public])
          end

end
