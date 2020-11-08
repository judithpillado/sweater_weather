class WeatherService
  def self.fetch_weather(latitude, longitude)
    response = conn.get("data/2.5/onecall") do |req|
      req.params[:lat] = latitude
      req.params[:lon] = longitude
      req.params[:exclude] = "minutely"
      req.params[:units] = "imperial"
      req.params[:appid] = ENV['WEATHER_API']
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new("http://api.openweathermap.org/")
  end
end
