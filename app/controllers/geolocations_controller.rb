class GeolocationsController < ApplicationController

  def show
    @coordinates = Geolocation.retrieve
  end

end
