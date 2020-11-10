class Api::V1::MunchiesController < ApplicationController
  def index
    restaurant = MunchiesFacade.fetch_restaurant(params[:location])
    render json: MunchiesSerializer.new(restaurant)
  end
end
