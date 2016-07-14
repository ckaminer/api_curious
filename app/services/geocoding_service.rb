class GeocodingService

  def initialize
    @_connection = Faraday.new("https://maps.googleapis.com")
  end

  def get_address(lat, lng)
    response = connection.post("/maps/api/geocode/json?latlng=#{lat},#{lng}&key=#{ENV["GOOGLE_API_KEY"]}")
    parsed = parse(response)
    formatted_address(parsed)
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def formatted_address(response)
    response[:results].first[:formatted_address]
  end

  private
    def connection
      @_connection
    end
end
