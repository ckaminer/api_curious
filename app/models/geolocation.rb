class Geolocation < OpenStruct

  def self.service
    @@service ||= GeolocationService.new
  end

  def self.retrieve
    coordinates = service.get_coordinates
    Geolocation.new(coordinates)
  end

end
