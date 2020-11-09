class Image
  attr_reader :id, :location, :image_url, :credit

  def initialize(background_data, location)
    # require "pry"; binding.pry
    @id = nil
    @location = location
    @image_url = background_data[:photos][0][:url]
    @credit = { source: "pexels.com",
                photographer: background_data[:photos][0][:photographer] }
  end
end
