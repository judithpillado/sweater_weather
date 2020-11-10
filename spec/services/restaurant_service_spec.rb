# require 'rails_helper'
#
# RSpec.describe RestaurantService, :vcr do
#   describe 'class methods' do
#     it 'fetch_coordinates' do
#
#       location = 'denver,co'
#
#       json = RestaurantService.fetch_coordinates(location)
#
#       expect(json).to be_a(Hash)
#
#       expect(json).to have_key :lat
#       expect(json[:lat]).to be_a(Float)
#
#       expect(json).to have_key :lng
#       expect(json[:lng]).to be_a(Float)
#     end
#   end
# end
