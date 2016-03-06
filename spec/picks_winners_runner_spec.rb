require_relative '../lib/picks_winners_runner'

describe PicksWinnersRunner do
  subject(:runner) { PicksWinnersRunner.new(provides_entrants, picks_winners, output, prize) }

  let(:provides_entrants) { double }
  let(:picks_winners) { instance_double('PicksWinners') }
  let(:output) { spy }
  let(:entrants) { double }
  let(:prize) { "POODR" }
  let(:winner) { "winner" }

  describe "#run" do
    it "outputs the winner and the prize" do
      allow(provides_entrants).to receive(:provide).and_return(entrants)
      allow(picks_winners).to receive(:pick).with(entrants).and_yield(winner)

      runner.run

      expect(output).to have_received(:announce).with(winner, prize)
    end
  end
end
