require "rails_helper"

describe GeolocationService do
  context "#geolocation" do
    it "returns your current coordinates" do
      VCR.use_cassette("geolocations") do
        geolocation = GeolocationService.new.get_coordinates
        expect(geolocation[:location].keys).to eq [:lat, :lng]
      end
    end
  end
end
