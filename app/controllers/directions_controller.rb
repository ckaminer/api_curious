class DirectionsController < ApplicationController

  def show
    lat = Geolocation.latitude
    lng = Geolocation.longitude
    @map = Map.retrieve(Geocoding.retrieve(lat, lng).results.first[:formatted_address], params[:chipotle])
    @directions = Direction.route(lat, lng, params[:chipotle])[:steps]
  end
end
