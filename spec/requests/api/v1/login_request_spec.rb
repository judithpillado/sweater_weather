require 'rails_helper'

describe 'Login API' do
  before(:each) do
    @user_params = {
      email: 'whatever@example.com',
      password: 'password',
      password_confirmation: 'password'
    }
    User.create(@user_params)
  end
  it 'registered user can login', :vcr do

    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    post '/api/v1/sessions', params: @user_params.to_json, headers: headers

    expect(response.status).to eq(200)
    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    user = User.last

    expect(json).to have_key(:data)
    expect(json[:data]).to have_key(:type)
    expect(json[:data]).to have_key(:id)
    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes]).to have_key(:email)
    expect(json[:data][:attributes]).to have_key(:api_key)
    expect(json[:data][:attributes][:api_key]).to eq(user.api_key)
    expect(json[:data][:attributes][:email]).to eq(user.email)
  end

  it 'does not login with incorrect credentials' do
    no_user_params = {
      email: 'email@example.com',
      password: 'password',
      password_confirmation: 'password'
    }
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }

    post '/api/v1/sessions', params: no_user_params.to_json, headers: headers

    expect(response.status).to eq(401)
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:body]).to eq('Incorrect credentials. Try again!')
  end
end
