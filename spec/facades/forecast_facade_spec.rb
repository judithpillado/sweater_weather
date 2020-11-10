require 'rails_helper'

RSpec.describe ForecastFacade, :vcr do
  describe 'class methods' do
    it '.fetch_forecast' do
      location = 'denver,co'
      result = ForecastFacade.fetch_forecast(location)

      expect(result).to be_a(Forecast)
    end
  end
end
