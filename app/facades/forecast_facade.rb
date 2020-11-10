class ForecastFacade
  def self.fetch_forecast(location)
    coordinates = MapquestService.fetch_coordinates(location)
    weather_data = WeatherService.fetch_weather(coordinates)
    Forecast.new(location, weather_data)
  end
end
