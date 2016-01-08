require_relative '../lib/provides_entrants_from_file'

describe ProvidesEntrantsFromFile do
  subject(:entrants_provider) { ProvidesEntrantsFromFile.new('spec/5names') }

  describe "#provide" do
    it "gets entrants from a file" do
      entrants = entrants_provider.provide

      expect(entrants.length).to eq(5)
      expect(entrants[1]).to eq("Kari Rohan")
    end
  end
end
