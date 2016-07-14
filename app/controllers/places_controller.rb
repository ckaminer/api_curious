class PlacesController < ApplicationController

  def new
    @chipotle = Place.new
  end

  def show
    lat = Geolocation.latitude
    lng = Geolocation.longitude
    @chipotle = Place.chipotle(lat, lng, params[:radius])
  end
end
