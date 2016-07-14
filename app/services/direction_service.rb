class DirectionService

  def initialize
    @_connection = Faraday.new("https://maps.googleapis.com")
    @_connection.headers["key"] = ENV["GOOGLE_API_KEY"]
  end

  def get_directions(lat, lng, destination)
    current = Geocoding.retrieve(lat, lng).results.first[:formatted_address]
    response = connection.get("/maps/api/directions/json?origin=#{current}&destination=#{destination}&key=#{ENV["GOOGLE_API_KEY"]}")
    json = parse(response)
    byebug
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
