require 'rails_helper'

describe 'Forecast API' do
  it 'returns forecast data', :vcr do
    get '/api/v1/forecast?location=denver,co'

    json = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(json[:data][:attributes][:location][:results][0][:providedLocation][:location]).to eq("denver,co")
    expect(json[:data][:attributes][:current]).to be_a(Hash)
    expect(json[:data][:attributes][:current][:datetime]).to be_a(String)
    expect(json[:data][:attributes][:daily]).to be_an(Array)
    expect(json[:data][:attributes][:daily].length).to eq(5)
    expect(json[:data][:attributes][:hourly][0]).to be_a(Hash)
    expect(json[:data][:attributes][:hourly][0][:visibility]).to be_nil
  end
end
