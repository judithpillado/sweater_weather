class DailyWeather
  attr_reader :date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon

  def initialize(attr)
    @date = "#{Time.at(attr[:dt]).year}-#{Time.at(attr[:dt]).month}-#{Time.at(attr[:dt]).day}"
    @sunrise = Time.at(attr[:sunrise])
    @sunset = Time.at(attr[:sunset])
    @max_temp = "#{attr[:temp][:max]} degrees Fahrenheit"
    @min_temp = "#{attr[:temp][:min]} degrees Fahrenheit"
    @conditions = attr[:weather][0][:description]
    @icon = attr[:weather][0][:icon]
  end

  def self.five_days(weather)
    weather.take(5).map do |per_day|
      DailyWeather.new(per_day)
    end
  end
end
