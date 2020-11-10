class MapquestService
  def self.fetch_coordinates(location)
    response = conn.get('geocoding/v1/address') do |req|
      req.params[:location] = location
    end
    JSON.parse(response.body, symbolize_names: true)[:results][0][:locations][0][:latLng]
  end

  def self.conn
    Faraday.new('http://www.mapquestapi.com/') do |req|
      req.params[:key] = ENV['MAPQUEST_API']
    end
  end
end
