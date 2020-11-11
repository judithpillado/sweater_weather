require 'rails_helper'

RSpec.describe RoadTripFacade, :vcr do
  describe 'class methods' do
    it '.create_road_trip' do
      origin = 'denver,co'
      destination = 'chicago,il'
      result = RoadTripFacade.create_road_trip(origin, destination)
    
      expect(result).to be_a(RoadTrip)
      expect(result.condition_upon_arrival).to be_a(String)
      expect(result.destination).to be_an(String)
      expect(result.origin).to be_a(String)
      expect(result.temperature_upon_arrival).to be_an(String)
      expect(result.travel_time).to be_an(String)
    end
  end
end
