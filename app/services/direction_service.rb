class DirectionService

  def initialize
    @_connection = Faraday.new("https://maps.googleapis.com")
  end

  def get_directions(lat, lng, destination)
    current = Geocoding.retrieve(lat, lng).address
    response = connection.get("/maps/api/directions/json?origin=#{current}&destination=#{destination}&key=#{ENV["GOOGLE_API_KEY"]}")
    json = parse(response)
    deliver_steps(json)
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def deliver_steps(response)
    response[:routes].first[:legs].first[:steps].map do |step|
      step[:html_instructions]
    end
  end

  private
    def connection
      @_connection
    end
end
