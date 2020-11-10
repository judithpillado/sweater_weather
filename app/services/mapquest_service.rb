class MapquestService
  def self.fetch_coordinates(location)
    response = conn.get('geocoding/v1/address') do |req|
      req.params[:location] = location
    end
    JSON.parse(response.body, symbolize_names: true)[:results][0][:locations][0][:latLng]
  end

  def self.fetch_distance_between(origin, destination)
    response = conn.get('/directions/v2/route') do |req|
      req.params[:from] = origin
      req.params[:to] = destination
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.location_data(location)
    response = conn.get('geocoding/v1/address/') do |f|
      f.params[:location] = location
      f.params[:maxResults] = 1
    end
    JSON.parse(response.body, symbolize_names: true)[:results][0][:locations][0]
  end

  def self.conn
    Faraday.new('http://www.mapquestapi.com/') do |req|
      req.params[:key] = ENV['MAPQUEST_API']
    end
  end
end
