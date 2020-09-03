class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: :home
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_variables

  def home
  end

  def set_variables
    @symbol_map = {tennis: 'blue-square.svg', soccer: 'green-halfcircle.svg', basketball: 'red-halfcircle.svg'}
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end




