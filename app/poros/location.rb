class Location
  attr_reader :coordinates, :city, :state, :country

  def initialize(destination_data)
    @coordinates = destination_data[:latLng]
    @city = destination_data[:adminArea5]
    @state = destination_data[:adminArea3]
    @country = destination_data[:adminArea1]
  end
end
