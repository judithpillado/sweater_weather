require 'rails_helper'

RSpec.describe WeatherService, :vcr do
  describe 'class methods' do
    it 'fetch_weather' do

      coordinates = { lat: 39.738453, lng: -104.984853 }

      json = WeatherService.fetch_weather(coordinates)

      expect(json).to be_a(Hash)

      current_weather = json[:current]
      expect(current_weather).to be_a(Hash)

      expect(current_weather).to have_key :dt
      expect(current_weather[:dt]).to be_an(Integer)

      expect(current_weather).to have_key :sunrise
      expect(current_weather[:sunrise]).to be_an(Integer)

      hourly_weather = json[:hourly]
      expect(hourly_weather).to be_an(Array)

      expect(hourly_weather[0]).to have_key :wind_speed

      daily_weather = json[:daily]
      expect(daily_weather).to be_an(Array)

      expect(daily_weather[0]).to have_key :sunset
    end

    it 'fetch_destination_forecast' do
      origin = 'denver,co'
      destination = 'chicago,il'

      route_info = MapquestService.fetch_distance_between(origin, destination)

      json = WeatherService.fetch_destination_forecast(route_info)
      expect(json).to be_a(Hash)
      expect(json).to have_key :lat
      expect(json[:lat]).to be_an(Float)
      expect(json).to have_key :lon
      expect(json[:lon]).to be_an(Float)
    end
  end
end
