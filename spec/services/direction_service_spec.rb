require "rails_helper"

describe DirectionService do
  context "#direction" do
    it "returns directions to the closest chipotle" do
      VCR.use_cassette("directions") do
        lat = 39.7511873
        lng = -105.0031571
        destination = PlaceService.new.get_chipotle(lat, lng, 500)
        directions = DirectionService.new.get_directions(lat, lng, destination)

        expect(directions.class).to eq Array
        expect(directions.first.class).to eq String
        expect(directions.first).to eq "Head <b>northeast</b> on <b>Wewatta St</b> toward <b>15th St</b>"
      end
    end
  end
end
