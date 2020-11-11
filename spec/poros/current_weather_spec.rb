require 'rails_helper'

RSpec.describe CurrentWeather do
  it 'exists' do
    attr = {
            :dt=>1604858400,
            :sunrise=>1604842631,
            :sunset=>1604879418,
            :temp=>287.58,
            :feels_like=>283.56,
            :humidity=>17,
            :uvi=>2.77,
            :visibility=>10000,
            :weather=>[{:description=>"scattered clouds", :icon=>"03n"}]
            }

    current_weather = CurrentWeather.new(attr)

    expect(current_weather.datetime).to eq('2020-11-08 12:00:00.000000000 -0600')
    expect(current_weather.sunrise).to eq('2020-11-08 07:37:11.000000000 -0600')
    expect(current_weather.sunset).to eq('2020-11-08T17:50:18.000-06:00')
    expect(current_weather.temperature).to eq('287.58 degrees Fahrenheit')
    expect(current_weather.feels_like).to eq('283.56 degrees Fahrenheit')
    expect(current_weather.humidity).to eq(17)
    expect(current_weather.uv_index).to eq(2.77)
    expect(current_weather.visibility).to eq(10000)
    expect(current_weather.conditions).to eq('scattered clouds')
    expect(current_weather.icon).to eq('03n')
  end
end
