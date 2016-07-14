class PlaceService

  def initialize
    @_connection = Faraday.new("https://maps.googleapis.com")
  end

  def get_chipotle(lat, lng, rad)
    response = connection.get("/maps/api/place/nearbysearch/json?location=#{lat},#{lng}&radius=#{rad}&types=food&name=chipotle&key=#{ENV["GOOGLE_API_KEY"]}")
    parsed = parse(response)
    formatted_address(parsed)
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def formatted_address(response)
    response[:results].first[:vicinity]
  end

  private
    def connection
      @_connection
    end
end
