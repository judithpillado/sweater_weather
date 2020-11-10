class MunchiesFacade

  def self.fetch_restaurant_info(origin, destination, food)
    destination_city = fetch_end_location(destination)
    coordinates = destination_city.coordinates
    travel_time = fetch_travel_time(origin, destination)
    forecast_summary = fetch_forecast_summary(coordinates)
    forecast_temperature = fetch_forecast_temperature(coordinates)
    restaurant = fetch_restaurant(destination, food)

    response = {
      "data": {
        "id": nil,
        "type": "munchie",
        "attributes": {
          "destination_city": "#{destination_city.city}, #{destination_city.state},",
          "travel_time": "About #{travel_time} hour(s)",
          "forecast": {
            "summary": forecast_summary,
            "temperature": forecast_temperature
          },
          "restaurant": {
            "name": restaurant.name,
            "address": restaurant.address
          }
        }
      }
    }
  end

  def self.fetch_end_location(destination)
    destination_data = MapquestService.location_data(destination)
    Location.new(destination_data)
  end

  def self.fetch_travel_time(origin, destination)
    route = MapquestService.fetch_distance_between(origin, destination)
    travel_time = route[:route][:legs][0][:time]
    (travel_time / 60 / 60)
  end

  def self.fetch_forecast_summary(coordinates)
    current = WeatherService.fetch_weather(coordinates)[:current]
    current[:weather][0][:description]
  end

  def self.fetch_forecast_temperature(coordinates)
    current = WeatherService.fetch_weather(coordinates)[:current]
    current[:temp]
  end

  def self.fetch_restaurant(destination, food)
    attributes = RestaurantService.fetch_by_location(destination, food)
    Munchie.new(attributes)
  end
end
