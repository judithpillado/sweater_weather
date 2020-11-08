class MapquestService
  def self.fetch_location(city)
    response = conn.get('geocoding/v1/address') do |req|
      req.params[:key] = ENV['MAPQUEST_API']
      req.params[:location] = city
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new("http://www.mapquestapi.com/")
  end
end
