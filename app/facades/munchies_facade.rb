class MunchiesFacade
  def self.fetch_(location)
    coordinates = MapquestService.fetch_coordinates(location)
    weather_data = WeatherService.fetch_weather(coordinates)
    # restaurant = RestaurantService.fetch_(location)
    # commute = MapquestService.distance_to_restaurant(location, restaurant)
    # Restaurant.new(start_location, end_location, weather_data, commute)
  end
end
