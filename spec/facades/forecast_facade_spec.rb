require 'rails_helper'

RSpec.describe ForecastFacade, :vcr do
  describe 'class methods' do
    it '.fetch_forecast' do
      location = 'denver,co'
      result = ForecastFacade.fetch_forecast(location)

      expect(result).to be_a(Forecast)
      expect(result.current).to be_a(CurrentWeather)
      expect(result.daily).to be_an(Array)
      expect(result.daily[0]).to be_a(DailyWeather)
      expect(result.hourly).to be_an(Array)
      expect(result.hourly[0]).to be_an(HourlyWeather)
    end
  end
end
