class RoadTrip
  attr_reader :origin, :destination, :travel_time, :temperature_upon_arrival, :condition_upon_arrival

  def initialize(route_data, forecast_data, origin, destination)
    @origin = origin
    @destination = destination
    @travel_time = fetch_travel_time(route_data)
    @temperature_upon_arrival = fetch_destination_temp(route_data, forecast_data)
    @condition_upon_arrival = fetch_destination_condition(route_data, forecast_data)
  end

  private

  def fetch_travel_time(route_data)
    hours = (route_data[:route][:time] / 60) / 60
    minutes = (route_data[:route][:time] / 60) % 60
    "#{hours} hour(s), #{minutes} minute(s)"
  end

  def fetch_destination_temp(route_data, forecast_data)
    average_hours = ((route_data[:route][:time].to_f / 60) / 60).round
    average_hours -= 1
    info = forecast_data[:hourly][average_hours]
    "#{info[:temp].to_i} degrees"
  end

  def fetch_destination_condition(route_data, forecast_data)
    average_hours = ((route_data[:route][:time].to_f / 60) / 60).round
    average_hours -= 1
    info = forecast_data[:hourly][average_hours]
    "#{info[:weather][0][:description]}"
  end
end
