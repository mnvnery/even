class SharesController < ApplicationController
  layout "navbar"

  def index
    @shares_all = Share.all
    # Problems with nil class solved with if statement in view:
    # @house_shares = Share.joins(:bills).where(bills: {house_id: @house})
    @shares = Share.where(user: current_user)
    @house = House.find(params[:house_id])
    @shares_paid_last_month = Share.where(paid: true).where("shares.updated_at < ?", Date.today.at_beginning_of_month).where("shares.updated_at >= ?", Date.today.at_beginning_of_month.prev_month)
    @shares_unpaid_last_month = Share.where(paid: !true).where("shares.updated_at < ?", Date.today.at_beginning_of_month).where("shares.updated_at >= ?", Date.today.at_beginning_of_month.prev_month)
    @users = User.joins(:memberships).where(memberships: {house_id: @house.id})
  end


  def history
    @shares_all = Share.all
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

  def shares_paid
    @shares_all.each do |share|
      # if share belongs to house
      if share.bill.house == @house
        # if share is paid
        if share.paid == true
          # if share last update is before this month and on or after the first of last month (assuming payment is always last action)
          if share.updated_at < Date.today.at_beginning_of_month && share.updated_at >= Date.today.at_beginning_of_month.prev_month
          end
        end
      end
    end
  end
end



# Pseudocode:
# need has with user and share

