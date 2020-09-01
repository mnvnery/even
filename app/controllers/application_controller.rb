class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: :home
  before_action :configure_permitted_parameters, if: :devise_controller?

  def home
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_up_path_for(resource)
    after_sign_up_path(:create_house)
  end
end
