require 'rails_helper'

describe 'Registration API' do
  it 'creates a new user', :vcr do
    user_params = {
      email: 'whatever@example.com',
      password: 'password',
      password_confirmation: 'password'
    }

    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    post '/api/v1/users', params: user_params.to_json, headers: headers

    expect(response.status).to eq(201)
    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    user = User.last

    expect(json[:data][:type]).to eq('users')
    expect(json[:data][:id]).to eq(user.id.to_s)
    expect(json[:data][:attributes]).to be_a(Hash)
    expect(json[:data][:attributes][:email]).to eq(user.email)
    expect(json[:data][:attributes][:api_key]).to eq(user.api_key)
  end

  it 'does not register a user without necessary information' do
    user_params = { email: 'whatever@example.com' }
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    post '/api/v1/users', params: user_params.to_json, headers: headers

    expect(response.status).to eq(400)
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:body]).to eq("Password digest can't be blank and Password can't be blank")
  end
end
