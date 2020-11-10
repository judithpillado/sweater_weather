require 'rails_helper'

RSpec.describe Munchie do
  it 'exists' do
    restaurant_data = JSON.parse(File.read('spec/fixtures/json/restaurant_data.json'), symbolize_names: true)
    restaurant = Munchie.new(restaurant_data)

    expect(restaurant).to be_an(Munchie)
    expect(restaurant.id).to eq(nil)
    expect(restaurant.address).to eq('4602 N Elizabeth St, Ste 120, and Pueblo, CO 81008')
    expect(restaurant.name).to eq('Wonderful Bistro')
  end
end
