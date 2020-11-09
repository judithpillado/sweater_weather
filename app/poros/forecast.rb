class Forecast
  attr_reader :id, :location, :current, :hourly, :daily

  def initialize(location, weather)
    @id = nil
    @location = location
    @current = CurrentWeather.new(weather[:current])
    @hourly = HourlyWeather.eight_hours(weather[:hourly])
    @daily = DailyWeather.five_days(weather[:daily])
  end
end
