# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  layout "signup"
  # before_action :configure_account_update_params, only: [:update]

  # Add if statment in the New action  like in the create

  # Add if statment in the form so the hidden field only shows if params has house_id
  # Add if statment for @house.name (New.hmtl.erb)
  # Add CSS to @house.name (New.hmtl.erb)

  # Try to generate the link using the rails routes prefix
  # "http://localhost:3000/users/sign_up?house_id=#{house.id}"

  # GET /resource/sign_up
  def new
    if params[:house_id]
      @house = House.find(params[:house_id])
    end

    super
  end

  # POST /resource
  def create
    if params[:user][:house_id]
      @house = House.find(params[:user][:house_id])
      params[:user].delete :house_id
    end

    super

    if !resource.new_record?
      @membership = Membership.create({ user: resource, house: @house })
    end

    # @membership = Membership.create({ user_id: resource.id, house_id: house.id })
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:house_id, :name])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    onboarding_houses_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
