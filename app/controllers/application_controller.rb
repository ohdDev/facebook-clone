class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name,:gender,:birthday,:email])
    end

    def after_sign_out_path_for(resource)
        new_user_session_path
      end

end

