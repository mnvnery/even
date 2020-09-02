class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  layout "signup", only: :home

  def home
    if user_signed_in?
      if current_user.houses.count == 1
        @membership = Membership.where(user: current_user).first
        redirect_to house_shares_path(@membership.house)
      else
        redirect_to houses_path
      end
    end
  end
end
