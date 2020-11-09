require 'rails_helper'

RSpec.describe TrailService, :vcr do
  describe 'class methods' do
    it 'fetch_trail' do

      coordinates = { lat: 39.738453, lon: -104.984853 }

      json = TrailService.fetch_trail(coordinates)

      expect(json).to be_a(Hash)
    end
  end
end
