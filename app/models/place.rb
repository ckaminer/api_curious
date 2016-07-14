class Place < OpenStruct

  def self.service
    @@service ||= PlaceService.new
  end

  def self.chipotle(lat, lng, rad)
    chipotle = service.get_chipotle(lat, lng, rad)
    Place.new(chipotle)
  end


end
