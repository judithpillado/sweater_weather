require 'rails_helper'

RSpec.describe MapquestService, :vcr do
  describe 'class methods' do
    it 'fetch_coordinates' do

      location = 'denver,co'

      json = MapquestService.fetch_coordinates(location)

      expect(json).to be_a(Hash)

      expect(json).to have_key :lat
      expect(json[:lat]).to be_a(Float)

      expect(json).to have_key :lng
      expect(json[:lng]).to be_a(Float)
    end

    it 'fetch_distance_between' do
      origin = 'denver,co'
      destination = 'chicago,il'

      route = MapquestService.fetch_distance_between(origin, destination)

      expect(route).to be_a(Hash)
      expect(route[:route]).to be_a(Hash)

      expect(route[:route]).to have_key :legs
      expect(route[:route][:legs]).to be_an(Array)

      route_info = route[:route][:legs][0]

      expect(route_info).to be_a(Hash)
      expect(route_info[:hasHighway]).to eq(true)
    end
  end
end
