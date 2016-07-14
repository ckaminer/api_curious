class DirectionsController < ApplicationController

  def show
    lat = Geolocation.latitude
    lng = Geolocation.longitude
    origin = Geocoding.retrieve(lat, lng).address
    @map = Map.retrieve(origin, params[:chipotle])
    @directions = Direction.route(lat, lng, params[:chipotle])[:steps]
  end
end
