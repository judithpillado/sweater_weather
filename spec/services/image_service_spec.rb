require 'rails_helper'

RSpec.describe ImageService, :vcr do
  describe 'class methods' do
    it 'by_location' do

      location = 'denver,co'

      json = ImageService.by_location(location)

      expect(json).to be_a(Hash)

      data = json[:photos][0]

      expect(data).to have_key :url
      expect(data[:url]).to be_a(String)

      expect(data).to have_key :photographer
      expect(data[:photographer]).to be_a(String)
    end
  end
end
