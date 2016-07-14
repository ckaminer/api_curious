class MapService

  # def initialize
  #   @_connection = Faraday.new("https://maps.googleapis.com")
  #   @_connection.headers["key"] = ENV["GOOGLE_API_KEY"]
  # end

  def get_map(lat, lng)
    response = connection.post("/maps/api/geocode/json?latlng=#{lat},#{lng}&key=#{ENV["GOOGLE_API_KEY"]}")
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
