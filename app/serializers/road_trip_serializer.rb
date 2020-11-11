class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  set_id { nil }
  attributes :origin, :destination, :travel_time, :temperature_upon_arrival, :condition_upon_arrival
end
