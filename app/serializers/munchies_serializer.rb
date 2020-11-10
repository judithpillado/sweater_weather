class MunchiesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :start_location, :end_location, :forecast, :restaurant
end
