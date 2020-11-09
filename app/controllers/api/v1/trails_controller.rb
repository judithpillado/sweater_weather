class Api::V1::TrailsController < ApplicationController
  def index
    trail = TrailFacade.generate_trail(params[:location])
    render json: TrailSerializer.new(trail)
  end
end
