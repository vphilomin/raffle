require_relative '../lib/show_past_winners_runner'

describe ShowPastWinnersRunner do
  subject(:runner) { ShowPastWinnersRunner.new(winners_store, output) }

  let(:output) { spy }
  let(:winners_store) { spy(:read => past_winners) }

  describe "#run" do
    context "with one past winner" do
      let(:past_winners) { {"A" => "Poodr"} }

      it "outputs the past winner and the prize" do
        runner.run

        expect(output).to have_received(:announce).with("A", "Poodr")
      end
    end

    context "with several past winners" do
      let(:past_winners) { {"A" => "Poodr", "B" => "Ruby on Rails"} }

      it "outputs all past winners and their prizes" do
        runner.run

        expect(output).to have_received(:announce).twice
        expect(output).to have_received(:announce).with("A", "Poodr")
        expect(output).to have_received(:announce).with("B", "Ruby on Rails")
      end
    end
  end
end
