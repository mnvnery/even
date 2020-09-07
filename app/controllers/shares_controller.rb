class SharesController < ApplicationController
  layout "navbar"

  def index
    @shares_all = Share.all
    # Problems with nil class solved with if statement in view:
    # @house_shares = Share.joins(:bills).where(bills: {house_id: @house})
    @shares = Share.where(user: current_user)
    @house = House.find(params[:house_id])
  end

  def edit
    @share = Share.find(params[:id])
  end

  def update
    @share = Share.find(params[:id])
    if @share.update(share_params)
      redirect_to houses_path
    else
      render :new
    end
  end

private

  def share_params
    params.require(:share).permit(:amount, :paid)
  end

end

