class BillsController < ApplicationController
  layout "navbar"

  def new
    @bill = Bill.new
    @house = House.find(params[:house_id])
  end

  def create
    @house = House.find(params[:house_id])
    @bill = Bill.new(bill_params)
    @bill.house = @house
    if @bill.save
      params[:share].each do |user_id, amount|
        if amount.to_i > 0
          Share.create(user_id: user_id, amount: amount.to_i, bill_id: @bill.id)
        end
      end
      redirect_to house_shares_path(@bill.house)
    else
      render :new
    end
  end

  def edit
    @bill = Bill.find(params[:id])
    @house = @bill.house
  end

  def update
    @house = House.find(params[:house_id])
    @bill = Bill.find(params[:id])
    @bill.house = @house
    if @bill.update(bill_params)
      params[:share].each do |user_id, amount|
      # 1. share? && amount == 0 > destroy
      # 2. share? && amount > 0 > update
      # 3. !share && amount > 0 > create
        share = Share.find_by(user_id: user_id.to_i, bill: @bill)
        if  amount.to_i == 0 && share
          share.destroy
        elsif amount.to_i > 0 && !share
          Share.create(user_id: user_id, amount: amount.to_i, bill_id: @bill.id)
        elsif amount.to_i > 0 && share
          share.update(amount: amount.to_i)
        end
      end
      redirect_to house_shares_path(@bill.house)
    else
      render :new
    end
  end

  def destroy
    @bill = Bill.find(params[:id])
    @bill.destroy
    redirect_to house_shares_path(@bill.house)
  end

private

  def bill_params
    params.require(:bill).permit(:name, :due_date, :category, :amount)
  end

end



  # def create
  #   @house = House.find(params[:house_id])
  #   @bill = Bill.new(bill_params)
  #   @bill.house = @house

  #   if params["commit"] == "Add"
  #     add_bill
  #   else
  #     split_bill
  #   end
  # end

  # def split_bill
  #   if @bill.save
  #     params[:share].each do |user_id, amount|
  #     split = params["bill"]["amount"].to_i / params["share"].keys.count
  #     Share.create(user_id: user_id, amount: split, bill_id: @bill.id)
  #     end
  #     redirect_to house_shares_path(@bill.house)
  #   else
  #     render :new
  #   end
  # end

  # def add_bill
  #   if @bill.save
  #     params[:share].each do |user_id, amount|
  #       if amount.to_i > 0
  #         Share.create(user_id: user_id, amount: amount.to_i, bill_id: @bill.id)
  #       end
  #     end
  #     redirect_to house_shares_path(@bill.house)
  #   else
  #     render :new
  #   end
  # end
