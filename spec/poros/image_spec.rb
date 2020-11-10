require 'rails_helper'

RSpec.describe Image do
  it 'exists' do
    background_data = JSON.parse(File.read('spec/fixtures/json/image_data.json'), symbolize_names: true)
    location = 'denver,co'
    image = Image.new(background_data, location)
    
    expect(image).to be_an(Image)
    expect(image.id).to eq(nil)
    expect(image.location).to eq(location)
    expect(image.image_url).to be_a(String)
    expect(image.credit[:source]).to eq('pexels.com')
    expect(image.credit[:photographer]).to be_a(String)
  end
end
