class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]

  # /houses
  def index
    @houses = House.all
  end

  # /houses/:id
  def show
  end

# /houses/:new
  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)
    if @house.save
      redirect_to house_path(@house)
    else
      render :new
    end
  end

 # houses/1/edit
  def edit
  end

  def update
    if @house.update(house_params)
      redirect_to house_path(@house)
    else
      render :new
    end
  end

  def destroy
    @house.destroy
    redirect_to houses_path
  end

  private

  def set_house
    @house = House.find(params[:id])
  end

  def house_params
    params.require(:house).permit(:house_balance, :name, :email)
  end

end
