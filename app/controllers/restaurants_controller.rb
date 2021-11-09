class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :destroy, :update]
  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurants_path
    end
  end

  def destroy
    if @restaurant.destroy
      redirect_to restaurants_path
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :rating)
  end
end
