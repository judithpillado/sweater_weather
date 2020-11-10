require 'rails_helper'

RSpec.describe Image do
  it 'exists' do
    background_data = JSON.parse(File.read('spec/fixtures/json/image_data.json'), symbolize_names: true)
    location = 'denver,co'
    image = Image.new(background_data, location)
    
    expect(image).to be_an(Image)
    expect(image.id).to eq(nil)
    expect(image.location).to eq('denver,co')
    expect(image.image_url).to eq('https://www.pexels.com/photo/dark-fog-forest-haze-6992/')
    expect(image.credit[:source]).to eq('pexels.com')
    expect(image.credit[:photographer]).to eq('Snapwire')
  end
end
