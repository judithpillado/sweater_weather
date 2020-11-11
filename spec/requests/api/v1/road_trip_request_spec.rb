require 'rails_helper'

describe 'Road Trip API' do
  it 'returns road trip data', :vcr do
    @user = create(:user)
    road_trip_data = {
      origin: 'denver,co',
      destination: 'chicago,il',
      api_key: @user.api_key
      # 7a53ae8e-37b9-4a05-9d99-936a95681464
    }

    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    post '/api/v1/road_trip', params: road_trip_data.to_json, headers: headers

    expect(response.status).to eq(200)
    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:type]).to eq('road_trip')
    expect(json[:data][:attributes][:origin]).to be_a(String)
    expect(json[:data][:attributes][:origin]).to eq('denver,co')
    expect(json[:data][:attributes][:destination]).to be_a(String)
    expect(json[:data][:attributes][:destination]).to eq('chicago,il')
    expect(json[:data][:attributes][:travel_time]).to be_a(String)
    expect(json[:data][:attributes][:temperature_upon_arrival]).to be_a(String)
    expect(json[:data][:attributes][:condition_upon_arrival]).to be_a(String)
  end

  it 'returns error with unauthorized user' do
    road_trip_data = {
      origin: 'denver,co',
      destination: 'chicago,il',
      api_key: 'coolio123'
    }

    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    post '/api/v1/road_trip', params: road_trip_data.to_json, headers: headers

    expect(response.status).to eq(401)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:body]).to eq('Unauthorized')
  end
end
