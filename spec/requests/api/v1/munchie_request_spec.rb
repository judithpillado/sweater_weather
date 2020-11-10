require 'rails_helper'

describe 'Munchie API' do
  it 'retrieves food and forecast information for a destination city' do
    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(json[:data]).to be_a(Hash)
    expect(json[:data][:id]).to eq(nil)
    expect(json[:data][:type]).to eq('munchie')
    expect(json[:data][:attributes][:destination_city]).to eq('pueblo,co')
    expect(json[:data][:attributes][:travel_time]).to be_a(String)
    expect(json[:data][:attributes][:forecast]).to be_a(Hash)
    expect(json[:data][:attributes][:forecast][:summary]).to be_a(String)
    expect(json[:data][:attributes][:forecast][:temperature]).to be_a(String)
    expect(json[:data][:attributes][:restaurant]).to be_a(Hash)
    expect(json[:data][:attributes][:restaurant][:name]).to be_a(String)
    expect(json[:data][:attributes][:restaurant][:address]).to be_a(String)
  end
end
