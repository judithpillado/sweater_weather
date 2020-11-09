require 'rails_helper'

RSpec.describe TrailFacade, :vcr do
  describe 'class methods' do
    it '.generate_trail' do
      location = 'denver,co'
      result = TrailFacade.generate_trail(location)

      expect(result).to be_a(Trail)
    end
  end
end
