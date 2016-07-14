require "rails_helper"

describe PlaceService do
  context "#place" do
    it "returns the address of the closest chipotle to your current address and within the given radius" do
      VCR.use_cassette("places") do
        lat = 39.7511873
        lng = -105.0031571
        chipotle = PlaceService.new.get_chipotle(lat, lng, 500)

        expect(chipotle).to eq "1480 16th Street, Denver"
      end
    end
  end
end
