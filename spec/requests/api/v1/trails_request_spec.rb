require 'rails_helper'

describe 'Trails API' do
  it 'retrieves forecast and nearby trail information for a location', :vcr do
    get '/api/v1/trails?location=denver,co'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(json[:data]).to be_a(Hash)
    expect(json[:data][:id]).to eq(nil)
    expect(json[:data][:type]).to eq('trail')
    expect(json[:data][:attributes][:location]).to eq('denver,co')
    expect(json[:data][:attributes][:forecast]).to be_a(Hash)
    expect(json[:data][:attributes][:trails]).to be_an(Array)
    expect(json[:data][:attributes][:trails][0][:name]).to be_a(String)
    expect(json[:data][:attributes][:trails][0][:name]).to_not eq(nil)
    expect(json[:data][:attributes][:trails][0][:summary]).to be_a(String)
    expect(json[:data][:attributes][:trails][0][:difficulty]).to be_a(String)
    expect(json[:data][:attributes][:trails][0][:location]).to be_a(String)
  end
end
