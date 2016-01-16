require_relative '../lib/parser'

describe Parser do
  subject(:parser) { Parser.new }

  describe '#parse' do
  
    context "when no flags" do
      let(:args) { ["140names", "POODR"] }

      it "gets the raffle entrants filename" do
        expect(parsed_options[:entrants_filename]).to eq("140names")
      end

      it "gets the prize" do
        expect(parsed_options[:prize]).to eq("POODR")
      end

      it "defaults to picking a single winner" do
        expect(parsed_options[:winner_count]).to eq(1)
      end

      it "does not show past winners instead of picking a new one" do
        expect(parsed_options[:show_past_winners]).to eq(false)
      end

      context "with special characters in the prize name" do
        let(:args) { ["140names", "$20000"] }

        it "parses the prize properly" do
          expect(parsed_options[:prize]).to eq("$20000")
        end
      end
    end

    context "with a number of winners flag" do
      let(:args) { ["-n", "2", "140names", "POODR"] }

      it "parses the number of winners to pick" do
        expect(parsed_options[:winner_count]).to eq(2)
      end

      it "gets the remaining non-flag arguments" do
        expect(parsed_options[:entrants_filename]).to eq("140names")
        expect(parsed_options[:prize]).to eq("POODR")
      end
    end

    context "with a show past winners flag" do
      let(:args) { ["--winners", "140names"] }

      it "sets the flag to display past winners rather than pick a new winner" do
        expect(parsed_options[:show_past_winners]).to eq(true)
      end

      it "gets the remaining non-flag arguments" do
        expect(parsed_options[:entrants_filename]).to eq("140names")
      end
    end

    def parsed_options
      parser.parse(args)
    end
  end
end
