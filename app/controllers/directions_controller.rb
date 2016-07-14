class DirectionsController < ApplicationController

  def show
    lat = Geolocation.latitude
    lng = Geolocation.longitude
    @directions = Direction.route(lat, lng, params[:chipotle])[:steps]
  end
end
