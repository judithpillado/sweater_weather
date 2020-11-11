class HourlyWeather
  attr_reader :time, :temperature, :wind_speed, :wind_direction, :conditions, :icon

  def initialize(attr)
    @time = "#{Time.at(attr[:dt]).hour}-#{Time.at(attr[:dt]).min}-#{Time.at(attr[:dt]).sec}"
    @temperature = "#{attr[:temp]} degrees Fahrenheit"
    @wind_speed = attr[:wind_speed]
    @wind_direction = attr[:wind_deg]
    @conditions = attr[:weather][0][:description]
    @icon = attr[:weather][0][:icon]
  end

  def self.eight_hours(weather)
    weather.take(8).map do |per_hour|
     HourlyWeather.new(per_hour)
   end
  end
end
