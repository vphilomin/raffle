require_relative '../lib/picks_winner'

describe PicksWinner do
  subject(:picks_winner) { PicksWinner.new }

  let(:entrants) { ["A", "B", "C"] }

  describe "#pick" do
    it "picks a random winner from the entrants" do
      winner = picks_winner.pick(entrants)

      expect(entrants).to include(winner)
    end
  end
end
