class TrailService
  def self.fetch_trail(coordinates)
    response = conn.get('data/get-trails') do |req|
      req.params[:key] = ENV["HIKING_PROJ_API_KEY"]
      req.params[:lat] = coordinates[:lat]
      req.params[:lon] = coordinates[:lon]
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://www.hikingproject.com/')
  end
end
