class ApplicationController < ActionController::Base

    around_action :switch_locale
    

    before_action :authenticate_user!

    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_notifications, if: :current_user
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name,:gender,:birthday,:email])
    end

   def switch_locale(&action)
        locale = params[:locale] || I18n.default_locale
        I18n.with_locale(locale, &action)
   end



    def after_sign_out_path_for(resource)
        new_user_session_path
      end

    private

  def set_notifications
    notifications = Notification.where(recipient: current_user).newest_first.limit(9)
    @unread = notifications.unread
    @read = notifications.read
  end
end

