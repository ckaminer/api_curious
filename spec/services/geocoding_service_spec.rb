require "rails_helper"

describe GeocodingService do
  context "#geocoding" do
    it "returns your current address" do
      VCR.use_cassette("geocodings") do
        lat = 39.7508388
        lng = -105.0028147
        geocode = GeocodingService.new.get_address(lat, lng)

        expect(geocode).to eq "1449 Wynkoop St, Denver, CO 80202, USA"
      end
    end
  end
end
