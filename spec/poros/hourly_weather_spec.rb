require 'rails_helper'

RSpec.describe HourlyWeather do
  it 'exists' do
    attr = {
            :dt=>1604858400,
            :temp=>287.58,
            :wind_speed=>7.66,
            :wind_deg=>198,
            :weather=>[{:description=>"clear sky", :icon=>"01d"}]
            }

    hourly_weather = HourlyWeather.new(attr)

    expect(hourly_weather.time).to eq('12-0-0')
    expect(hourly_weather.temperature).to eq('287.58 degrees Fahrenheit')
    expect(hourly_weather.wind_speed).to eq(7.66)
    expect(hourly_weather.wind_direction).to eq(198)
    expect(hourly_weather.conditions).to eq('clear sky')
    expect(hourly_weather.icon).to eq('01d')
  end
end
