class ForecastFacade
  def self.fetch_forecast(city)
    location = MapquestService.fetch_location(city)
    latitude = location[:results][0][:locations][0][:latLng][:lat]
    longitude = location[:results][0][:locations][0][:latLng][:lng]
    weather = WeatherService.fetch_weather(latitude, longitude)
    Forecast.new(location, weather)
  end
end
