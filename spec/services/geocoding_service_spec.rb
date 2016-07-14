require "rails_helper"

describe GeocodingService do
  context "#geocoding" do
    it "returns your current address" do
      VCR.use_cassette("geocodings") do
        lat = Geolocation.latitude
        lng = Geolocation.longitude
        geocode = GeocodingService.new.get_address(lat, lng)
        expect(geocode[:results].first.keys).to eq [:address_components, :formatted_address, :geometry, :place_id, :types]
      end
    end
  end
end
