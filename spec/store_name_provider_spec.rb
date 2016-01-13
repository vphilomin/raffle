require_relative '../lib/store_name_provider'

describe StoreNameProvider do
  subject(:store_namer) { StoreNameProvider.new(entrants_filename) }

  context "when no subdirs in entrants filename" do
    let(:entrants_filename) { "5names" }
    let(:store_name) { "5names.raffle" }
    
    it "returns the proper store name" do
      expect(store_namer.name).to eq(store_name)
    end
  end

  context "when nested in a subdirectory" do
    let(:entrants_filename) { "spec/5names" }
    let(:store_name) { "spec/5names.raffle" }

    it "returns the proper store name" do
      expect(store_namer.name).to eq(store_name)
    end
  end
end
