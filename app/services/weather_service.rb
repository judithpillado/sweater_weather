class WeatherService
  def self.fetch_weather(coordinate)
    response = conn.get("data/2.5/onecall") do |req|
      req.params[:lat] = coordinate[:lat]
      req.params[:lon] = coordinate[:lng]
      req.params[:exclude] = "minutely"
      req.params[:units] = "imperial"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.fetch_destination_forecast(route_info)
    response = conn.get("data/2.5/onecall") do |req|
      req.params[:lat] = route_info[:route][:locations].last[:latLng][:lat]
      req.params[:lon] = route_info[:route][:locations].last[:latLng][:lng]
      req.params[:exclude] = "minutely"
      req.params[:units] = "imperial"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new("http://api.openweathermap.org/") do |req|
      req.params[:appid] = ENV['WEATHER_API']
    end
  end
end
