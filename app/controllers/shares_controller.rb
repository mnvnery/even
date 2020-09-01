class SharesController < ApplicationController

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
