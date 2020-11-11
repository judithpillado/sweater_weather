class CurrentWeather
  attr_reader :datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uv_index, :visibility, :conditions, :icon

  def initialize(attr)
    @datetime = Time.at(attr[:dt])
    @sunrise = Time.at(attr[:sunrise])
    @sunset = Time.at(attr[:sunset])
    @temperature = "#{attr[:temp]} degrees Fahrenheit"
    @feels_like = "#{attr[:feels_like]} degrees Fahrenheit"
    @humidity = attr[:humidity]
    @uv_index = attr[:uvi]
    @visibility = attr[:visibility]
    @conditions = attr[:weather][0][:description]
    @icon = attr[:weather][0][:icon]
  end
end
