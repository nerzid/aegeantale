class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:user) << :avatar
  end
end
