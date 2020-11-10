class RestaurantService
  def self.fetch_by_location(location, search_param)
    response = conn.get('/v3/businesses/search') do |req|
      req.params[:term] = search_param
      req.params[:location] = location
      req.params[:limit] = 1
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new( url: "https://api.yelp.com") do |req|
      req.headers['Authorization'] = "Bearer #{ENV['YELP_API']}"
    end
  end
end
