require 'rails_helper'

RSpec.describe Forecast do
  it 'exists' do
    weather_data = JSON.parse(File.read('spec/fixtures/json/forecast_data.json'), symbolize_names: true)
    location = 'denver,co'
    forecast = Forecast.new(location, weather_data)

    expect(forecast).to be_a(Forecast)
    expect(forecast.id).to eq(nil)
    expect(forecast.location).to eq('denver,co')
    expect(forecast.current.icon).to be_a(String)
    expect(forecast.current.conditions).to eq('clear sky')
    expect(forecast.hourly).to be_an(Array)
    expect(forecast.hourly[0].wind_speed).to eq(7.66)
    expect(forecast.daily).to be_an(Array)
    expect(forecast.daily[0].max_temp).to eq(287.58)
  end
end
