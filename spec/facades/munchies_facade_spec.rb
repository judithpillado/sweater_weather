require 'rails_helper'

RSpec.describe MunchiesFacade, :vcr do
  describe 'class methods' do
    it '.fetch_restaurant_info' do
      origin = 'denver,co'
      destination = 'pueblo,co'
      food = 'chinese'
      result = MunchiesFacade.fetch_restaurant_info(origin, destination, food)
      expect(result).to be_a(Hash)
      expect(result).to have_key :data
      expect(result[:data]).to have_key :id
      expect(result[:data]).to have_key :type
      expect(result[:data]).to have_key :attributes
    end

    it '.fetch_end_location' do
      destination = 'pueblo,co'
      result = MunchiesFacade.fetch_end_location(destination)

      expect(result).to be_a(Location)
      expect(result.city).to eq('Pueblo')
      expect(result.state).to eq('CO')
      expect(result.coordinates).to be_a(Hash)
      expect(result.coordinates).to have_key :lat
      expect(result.coordinates).to have_key :lng
    end

    it '.fetch_travel_time' do
      origin = 'denver,co'
      destination = 'pueblo,co'
      result = MunchiesFacade.fetch_travel_time(origin, destination)

      expect(result).to eq(1)
    end

    it '.fetch_forecast_summary' do
      coordinates = { lat: 39.738453, lng: -104.984853 }
      result = MunchiesFacade.fetch_forecast_summary(coordinates)

      expect(result).to be_a(String)
    end

    it '.fetch_forecast_temperature' do
      coordinates = { lat: 39.738453, lng: -104.984853 }
      result = MunchiesFacade.fetch_forecast_temperature(coordinates)

      expect(result).to be_an(Float)
    end

    it '.fetch_restaurant' do
      destination = 'pueblo,co'
      food = 'chinese'
      result = MunchiesFacade.fetch_restaurant(destination, food)
      
      expect(result).to be_a(Munchie)
      expect(result.address).to be_a(String)
      expect(result.id).to eq(nil)
      expect(result.name).to be_a(String)
    end
  end
end
