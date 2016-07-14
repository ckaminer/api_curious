class GeolocationService

  def initialize
    @_connection = Faraday.new("https://www.googleapis.com")
    # @_connection.headers["key"] = ENV["GOOGLE_API_KEY"]
  end

  def get_coordinates
    response = connection.post("geolocation/v1/geolocate?key=#{ENV["GOOGLE_API_KEY"]}")
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
