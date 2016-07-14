class Geocoding < OpenStruct

  def self.service
    @@service ||= GeocodingService.new
  end

  def self.retrieve(lat, lng)
    address = service.get_address(lat, lng)
    Geocoding.new({address: address})
  end

end
