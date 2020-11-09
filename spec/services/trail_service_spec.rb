require 'rails_helper'

RSpec.describe TrailService, :vcr do
  describe 'class methods' do
    it 'fetch_trail' do

      latitude = 39.738453
      longitude = -104.984853

      json = TrailService.fetch_trail(latitude, longitude)

      expect(json).to be_a(Hash)
    end
  end
end
