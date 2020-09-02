class BillsController < ApplicationController

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
      # find share using user_id and @bill_id
      # if amount equals to 0 and there is a share deleted it
      # create or update share (if)

        if amount.to_i > 0
          Share.create(user_id: user_id, amount: amount.to_i, bill_id: @bill.id)
        end
      end
      redirect_to house_path(@bill.house)
    else
      render :new
    end
  end

  def edit
    @bill = Bill.find(params[:id])
  end

  def update
    @bill = Bill.find(params[:id])
    if @bill.update(bill_params)
      redirect_to house_path(@bill.house)
    else
      render :new
    end
  end

  def destroy
    @bill = Bill.find(params[:id])
    @bill.destroy
    redirect_to house_path(@bill.house)
  end

private

  def bill_params
    params.require(:bill).permit(:name, :due_date, :category, :amount)
  end

end
