class RoadTripFacade
  def self.create_road_trip(origin, destination)
    route_data = MapquestService.fetch_distance_between(origin, destination)
    forecast_data = WeatherService.fetch_destination_forecast(route_data)
    RoadTrip.new(route_data, forecast_data, origin, destination)
  end
end
