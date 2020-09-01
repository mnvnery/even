class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :create_house, :add_members

  def show
    @user = current_user
    @house = House.new
    render_wizard
  end

end
