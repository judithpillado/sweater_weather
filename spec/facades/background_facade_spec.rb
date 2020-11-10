require 'rails_helper'

RSpec.describe BackgroundFacade, :vcr do
  describe 'class methods' do
    it '.fetch_background' do
      location = 'denver,co'
      result = BackgroundFacade.fetch_background(location)

      expect(result).to be_an(Image)
      expect(result.credit).to be_a(Hash)
      expect(result.image_url).to be_a(String)
      expect(result.location).to be_a(String)
    end
  end
end
