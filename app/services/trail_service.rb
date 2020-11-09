class TrailService
  def self.fetch_trail(latitude, longitude)
    response = conn.get('data/get-trails') do |req|
      req.params[:key] = ENV['HIKING_API']
      req.params[:lat] = latitude
      req.params[:lon] = longitude
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://www.hikingproject.com/')
  end
end
