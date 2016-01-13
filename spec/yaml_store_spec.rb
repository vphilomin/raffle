require 'fileutils'
require_relative '../lib/yaml_store.rb'

describe YamlStore do
  subject(:store) { YamlStore.new(store_name_provider) }

  let(:entrants_filename) { "spec/5names" }
  let(:winner) { "winner" }
  let(:prize) { "POODR" }
  let(:store_name) { "spec/5names.raffle" }
  let(:store_name_provider) { spy(:name => store_name) }

  describe "#write" do

    before { delete_all_store_files }

    it "creates the yaml store with the appropriate name" do
      store.write(winner, prize)

      expect(File.exists?(store_name)).to be(true)
    end

    it "writes the winner and prize to the yaml store" do
      store.write(winner, prize)

      winners = read_winners_from_store
      expect(winners.count).to eq(1)
      expect(winners[winner]).to eq(prize)
    end

    after { delete_all_store_files }

    def delete_all_store_files
      FileUtils.rm_rf Dir.glob('spec/*.raffle')
    end

    def read_winners_from_store
      store = YAML::Store.new(store_name)
      store.transaction do
        store["winners"]
      end
    end
  end
end
