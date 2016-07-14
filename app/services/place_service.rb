class PlaceService
  "/maps/api/place/nearbysearch/json?location=39.7507067,-105.0024724&radius=500&types=food&name=chipotle&key=AIzaSyDQ98R10eGF-mRg3ESqm8isiRMlTVeN3Dk"

  def initialize
    @_connection = Faraday.new("https://maps.googleapis.com")
    @_connection.headers["key"] = ENV["GOOGLE_API_KEY"]
  end

  def get_chipotle(lat, lng, rad)
    response = connection.post("/maps/api/place/nearbysearch/json?location=#{lat},#{lng}&radius=#{rad}&types=food&name=chipotle&key=#{ENV["GOOGLE_API_KEY"]}")
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    def connection
      @_connection
    end
end
