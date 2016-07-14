class Map < OpenStruct

  def self.service
    @@service ||= MapService.new
  end

  def self.retrieve(current, destination)
    "https://www.google.com/maps/embed/v1/directions?origin=#{current}
      &destination=#{destination}
      &key=#{ENV["GOOGLE_API_KEY"]}"
  end

end
