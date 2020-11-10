class Api::V1::MunchiesController < ApplicationController
  def index
    origin = params[:start]
    destination = params[:end]
    food = params[:food]
    restaurant = MunchiesFacade.fetch_restaurant_info(origin, destination, food)
    # render json: MunchiesSerializer.new(restaurant)
    render json: restaurant
  end
end
