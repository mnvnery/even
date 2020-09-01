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
      # here is where the share creation logic will go
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
