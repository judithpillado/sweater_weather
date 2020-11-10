class RestaurantService
  def self.fetch_(location)
    response = conn.get('"/v3/businesses/search') do |req|
      req.params[:term] = 'chinese'
      req.params[:location] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new( url: "https://api.yelp.com") do |req|
      req.headers['Authorization'] = "Bearer #{ENV['YELP_API']}"
    end
  end
end
