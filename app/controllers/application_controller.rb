class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up){|u| u.permit(:name, :birthday,
      :role, :email, :password)
    }
    devise_parameter_sanitizer.permit(:account_update){|u| u.permit(:name, :birthday,
      :role, :email, :password, :current_password)
    }
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

end
