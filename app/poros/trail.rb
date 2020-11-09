class Trail
  attr_reader :id,
              :location,
              :forecast,
              :trails

  def initialize(trail, location, weather, commute)
    @id = nil
    @location = location
    @forecast = {
      summary: weather[:current][:weather][0][:description],
      temperature: weather[:current][:temp]
    }
    @trails = [
      {
        name: trail[:trails][0][:name],
        summary: trail[:trails][0][:summary],
        difficulty: trail[:trails][0][:difficulty],
        location: trail[:trails][0][:location],
        distance_to_trail: commute[:route][:distance]
      }
    ]
  end
end
