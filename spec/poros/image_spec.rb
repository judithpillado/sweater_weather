# require 'rails_helper'
#
# RSpec.describe Image do
#   it 'exists' do
#     background_data = {
#             :id=>nil,
#             :url=>"https://www.pexels.com/photo/photo-of-people-holding-each-other-s-hands-3184423/"
#             }
#     location = 'denver,co'
#     image = Image.new(background_data, location)
#
#     expect(image).to be_an(Image)
#     expect(image.id).to eq(nil)
#     expect(image.location).to eq(location)
#     expect(image.image_url).to eq('https://www.pexels.com/photo/photo-of-people-holding-each-other-s-hands-3184423/')
#     expect(image.credit[:photographer]).to eq('fauxels')
#   end
# end
