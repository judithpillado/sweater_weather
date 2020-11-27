require 'rails_helper'

RSpec.describe RoadTrip, :vcr do
  it 'exists' do
    origin = 'denver,co'
    destination = 'chicago,il'
    route_data = MapquestService.fetch_distance_between(origin, destination)
    forecast_data = WeatherService.fetch_destination_forecast(route_data)

    road_trip = RoadTrip.new(route_data, forecast_data, origin, destination)

    expect(road_trip).to be_an(RoadTrip)
    expect(road_trip.origin).to eq('denver,co')
    expect(road_trip.destination).to eq('chicago,il')
    expect(road_trip.travel_time).to eq('14 hour(s), 24 minute(s)')
    expect(road_trip.temperature_upon_arrival).to eq('36 degrees')
    expect(road_trip.condition_upon_arrival).to eq('clear sky')
  end
end
