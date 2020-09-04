# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  layout "signup"

  # TO DO:
  def after_sign_in_path_for(resource)
    if @house
      house_shares_path(@house)
    else
      onboarding_houses_path
    end
  end


  # GET /resource/sign_in
  def new
    if params[:house_id]
      @house = House.find(params[:house_id])
    end

    super

  end

  # POST /resource/sign_in
  def create
    @house = nil
    if params[:user][:house_id]
      @house = House.find(params[:user][:house_id])
      params[:user].delete :house_id
    end

      super

      if !resource.new_record? && @house
        @membership = Membership.create({ user: resource, house: @house })
      end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:house_id])
  end
end

