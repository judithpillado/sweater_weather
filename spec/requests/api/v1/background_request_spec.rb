require 'rails_helper'

describe 'Background API' do
  it 'returns background image for location', :vcr do
    get '/api/v1/backgrounds?location=denver,co'

    json = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    
    expect(json[:data]).to be_a(Hash)
    expect(json[:data][:id]).to eq(nil)
    expect(json[:data][:attributes][:image_url]).to be_a(String)
    expect(json[:data][:attributes][:credit][:source]).to be_a(String)
    expect(json[:data][:attributes][:credit][:photographer]).to be_a(String)
  end
end
