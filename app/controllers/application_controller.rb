class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_variables

  def home
  end

  def set_variables
    @icon_names = ['water', 'rent', 'internet', 'electricity', 'gas']
    @symbols_map = { water: 'blue-square.svg', rent: 'green-halfcircle.svg', gas: 'red-halfcircle.svg', internet: 'sand-triangle.svg', electricity: 'yellow-circle.svg' }
    @icons_map = { water: 'water.svg', rent: 'rent.svg', internet: 'internet.svg', electricity: 'electricity.svg', gas: 'gas.svg' }
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end




