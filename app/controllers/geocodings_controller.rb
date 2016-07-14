class GeocodingsController < ApplicationController

  def show
    lat = Geolocation.latitude
    lng = Geolocation.longitude
    @address = Geocoding.retrieve(lat, lng).address
  end

end
