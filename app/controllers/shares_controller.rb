class SharesController < ApplicationController
  layout "navbar"

  def index
    @shares_all = Share.includes(:bill).order("bills.due_date")
    # Problems with nil class solved with if statement in view:
    # @house_shares = Share.joins(:bills).where(bills: {house_id: @house})
    @shares = Share.includes(:bill).where(user: current_user).order("bills.due_date")
    @house = House.find(params[:house_id])
    @shares_paid_last_month = Share.where(paid: true).where("shares.updated_at < ?", Date.today.at_beginning_of_month).where("shares.updated_at >= ?", Date.today.at_beginning_of_month.prev_month)
    @shares_unpaid_last_month = Share.where(paid: !true).where("shares.updated_at < ?", Date.today.at_beginning_of_month).where("shares.updated_at >= ?", Date.today.at_beginning_of_month.prev_month)
    @users = User.joins(:memberships).where(memberships: {house_id: @house.id})
    @house_shares_last_month = house_shares_last_month
    @shares_paid = shares_paid(house_shares_last_month)
    @paid_winner = paid_winner(@shares_paid)
    @shares_unpaid = shares_unpaid(house_shares_last_month)
    @unpaid_winner = unpaid_winner(@shares_unpaid)
    @winner_last_month = winner_last_month(@unpaid_winner, @paid_winner)
  end

  def history
    @shares_all = Share.order("shares.paid_date DESC")
    @house = House.find(params[:house_id])
  end

  def edit
    @share = Share.find(params[:id])
  end

  def update
  end

  private

  def share_params
    params.require(:share).permit(:amount, :paid)
  end

  def house_shares_last_month
    house_shares = []
    @house.shares.each do |share|
      if share.updated_at < Date.today.at_beginning_of_month.to_time
        if share.updated_at >= Date.today.at_beginning_of_month.prev_month.to_time
          house_shares << share
        end
      end
    end
    return house_shares
  end

  def shares_paid(house_shares)
    house_shares_paid = []
    house_shares.each do |share|
      if share.paid == true
        house_shares_paid << share
      end
    end
    house_shares_paid
  end

  def shares_unpaid(house_shares)
    house_shares_unpaid = []
    house_shares.each do |share|
      if share.paid == nil
        house_shares_unpaid << share
      elsif share.paid == false
        house_shares_unpaid << share
      end
    end
    house_shares_unpaid
  end

  def paid_winner(shares_paid)
    paid_fewest = shares_paid.reduce(Hash.new(0)) { |b, a| b.merge({a => b[a] + 1}) }.min_by{|k,v| v}
    if paid_fewest
      if paid_fewest.first.bill.house == @house
        paid_fewest[0].user
      else
        nil
      end
    end
  end

  def unpaid_winner(shares_unpaid)
    unpaid_most = shares_unpaid.reduce(Hash.new(0)) { |b, a| b.merge({a => b[a] + 1}) }.max_by{|k,v| v}
    if unpaid_most
      if unpaid_most.first.bill.house == @house
        unpaid_most[0].user
      else
        nil
      end
    end
  end

  def winner_last_month(unpaid_winner, paid_winner)
    if paid_winner.nil? && unpaid_winner.nil?
      winner = nil
    elsif paid_winner.nil?
      winner = unpaid_winner
    elsif unpaid_winner.nil?
      winner = paid_winner
    else
      winner = winner_logic(unpaid_winner, paid_winner)
    end
    return winner
  end

  def winner_logic(unpaid_winner, paid_winner)
    paid_durations = []
    unpaid_durations = []

    paid_winner.shares.each do |share|
      paid_durations << share.updated_at - share.created_at
    end

    unpaid_winner.shares.each do |share|
      unpaid_durations << (Date.today.at_beginning_of_month - 1).to_time - share.created_at
    end

    if (paid_durations.sum(0.0) / paid_durations.size) >= (unpaid_durations.sum(0.0) / unpaid_durations.size)
      return paid_winner
    else
      return unpaid_winner
    end

  end
end
