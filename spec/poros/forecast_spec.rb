require 'rails_helper'

RSpec.describe Forecast do
  # it 'exists' do
  #   attr = {
  #     id: nil,
  #     location: 'denver,co',
  #     current: {
  #               "datetime": "2020-11-08T15:07:42.000-06:00",
  #               "sunrise": "2020-11-08T07:37:11.000-06:00",
  #               "sunset": "2020-11-08T17:50:18.000-06:00",
  #               "temperature": 57.97,
  #               "feels_like": 48,
  #               "humidity": 12,
  #               "uv_index": 2.77,
  #               "visibility": 10000,
  #               "conditions": "clear sky",
  #               "icon": "01d"
  #           },
  #     hourly: [
  #               {
  #                   "time": "2020-11-08T15:00:00.000-06:00",
  #                   "temperature": 57.97,
  #                   "wind_speed": 17.13,
  #                   "wind_direction": 198,
  #                   "conditions": "clear sky",
  #                   "icon": "01d"
  #               }
  #             ],
  #     daily: [
  #               {
  #                 "time": "2020-11-08T12:00:00.000-06:00",
  #                 "temperature": {
  #                     "day": 53.78,
  #                     "min": 48.99,
  #                     "max": 57.97,
  #                     "night": 49.15,
  #                     "eve": 56.14,
  #                     "morn": 56.35
  #                   },
  #                   "wind_speed": 11.9,
  #                   "wind_direction": 180,
  #                   "conditions": "clear sky",
  #                   "icon": "01d"
  #               }
  #             ]
  #   }
  #
  #   location = MapquestService.fetch_location(city)
  #   forecast = Forecast.new(location, attr)
  #   expect(forecast.id).to eq(nil)
  #   expect(forecast.location).to eq('denver,co')
  #   expect(forecast.current).to be_a(Hash)
  #   expect(forecast.hourly).to be_an(Array)
  #   expect(forecast.daily).to be_an(Array)
  #   location = 'denver,co'
  #   weather = WeatherService.fetch_weather()
  #   forecast = Forecast.new(location, weather)
  #   expect(forecast.id).to eq(nil)
  #   expect(forecast.current).to be_a(Hash)
  #   expect(forecast.hourly).to be_an(Array)
  #   expect(forecast.daily).to be_an(Array)
  # end
end
