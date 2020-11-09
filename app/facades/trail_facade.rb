class TrailFacade
  def self.generate_trail(location)
    coordinates = MapquestService.fetch_location(location)
    latitude = coordinates[:results][0][:locations][0][:latLng][:lat]
    longitude = coordinates[:results][0][:locations][0][:latLng][:lng]
    weather = WeatherService.fetch_weather(latitude, longitude)
    trail = TrailService.fetch_trail(latitude, longitude)
    commute = MapquestService.distance_to_trail(location, trail)
    Trail.new(trail, location, weather, commute)
  end
end
