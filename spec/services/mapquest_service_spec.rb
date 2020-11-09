require 'rails_helper'

RSpec.describe MapquestService, :vcr do
  describe 'class methods' do
    it 'fetch_location' do

      city = 'denver,co'

      json = MapquestService.fetch_location(city)

      expect(json).to be_a(Hash)
      expect(json).to have_key :results
      expect(json[:results]).to be_an(Array)

      coordinates = json[:results][0][:locations][0][:latLng]

      expect(coordinates).to have_key :lat
      expect(coordinates[:lat]).to be_a(Float)

      expect(coordinates).to have_key :lng
      expect(coordinates[:lng]).to be_a(Float)
    end
  end
end
