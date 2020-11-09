class BackgroundFacade
  def self.fetch_background(location)
    background_data = ImageService.by_location(location)
    Image.new(background_data, location)
  end
end
