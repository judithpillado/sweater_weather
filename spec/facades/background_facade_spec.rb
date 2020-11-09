require 'rails_helper'

RSpec.describe BackgroundFacade, :vcr do
  describe 'class methods' do
    it '.fetch_background' do
      location = 'denver,co'
      result = BackgroundFacade.fetch_background(location)

      expect(result).to be_an(Image)
    end
  end
end
