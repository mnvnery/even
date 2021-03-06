class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]
  layout "signup", only: [:onboarding]
  layout "navbar", only: [:settings]

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
      @membership = Membership.create(user: current_user, house: @house)
      redirect_to onboarding_link_house_path(@house)
    else
      render :new
    end
  end

 # houses/1/edit
  def edit
  end

  def update
    if @house.update(house_params)
      redirect_to house_shares_path(@house)
    else
      render :new
    end
  end

  def destroy
    @house.destroy
    redirect_to houses_path
  end

  def onboarding
    # if current_user.houses.length > 0
    #   redirect_to house_shares_path(params[:house_id])
      @house = House.new
  end

  def onboarding_link
    @house = House.find(params[:id])
  end

  def settings
    @house = House.find(params[:id])
    @membership = Membership.where(user: current_user, house: @house).first
  end

  private

  def set_house
    @house = House.find(params[:id])
  end

  def house_params
    params.require(:house).permit(:name)
  end
end
