class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :location, :image_url, :credit
end
