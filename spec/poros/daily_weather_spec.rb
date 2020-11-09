require 'rails_helper'

RSpec.describe DailyWeather do
  it 'exists' do
    attr = {
            :dt=>1604858400,
            :sunrise=>1604842631,
            :sunset=>1604879418,
            :temp=>{
                :min=>282.59,
                :max=>287.58,
              },
            :weather=>[{:description=>"scattered clouds", :icon=>"03n"}]
            }

    daily_weather = DailyWeather.new(attr)

    expect(daily_weather.date).to eq('2020-11-08 12:00:00.000000000 -0600')
    expect(daily_weather.sunrise).to eq('2020-11-08 07:37:11.000000000 -0600')
    expect(daily_weather.sunset).to eq('2020-11-08T17:50:18.000-06:00')
    expect(daily_weather.max_temp).to eq(287.58)
    expect(daily_weather.min_temp).to eq(282.59)
    expect(daily_weather.conditions).to eq('scattered clouds')
    expect(daily_weather.icon).to eq('03n')
  end
end
