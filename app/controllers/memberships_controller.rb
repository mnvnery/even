class MembershipsController < ApplicationController
def index
  @membership = Membership.all
  @house = House.find(params[:house_id])
end

  def destroy
    @house = House.find(params[:house_id])

    @membership = Membership.find(params[:id])
    if current_user.shares.where(bill: @house.bills) == []
      @membership.destroy
      redirect_to houses_path
    else
      flash[:alert] = "You can't leave without paying all your shares"
      render :index
    end
  end
end
