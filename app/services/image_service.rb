class ImageService
  def self.by_location(location)
    response = conn.get('/v1/search') do |req|
      req.params[:query] = location
      req.params[:per_page] = 1
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.pexels.com/') do |req|
      req.headers['Authorization'] = ENV['PEXELS_API']
    end
  end
end
