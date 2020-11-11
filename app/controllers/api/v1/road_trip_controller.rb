class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    origin = road_trip_params[:origin]
    destination = road_trip_params[:destination]
    if user
      road_trip = RoadTripFacade.create_road_trip(origin, destination)
      render json: RoadTripSerializer.new(road_trip), status: 200
    else
      render json: { body: 'Unauthorized' }, status: 401
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination)
  end
end
