class Direction < OpenStruct

  def self.service
    @@service ||= DirectionService.new
  end

  def self.route(lat, lng, rad)
    directions = service.get_directions(lat, lng, rad)
    step_directions = {steps: directions}
    Direction.new(step_directions)
  end


end
