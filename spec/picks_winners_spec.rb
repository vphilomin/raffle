require_relative '../lib/picks_winners'

describe PicksWinners do
  subject(:picks_winners) { PicksWinners.new }

  let(:entrants) { ["A", "B", "C"] }

  describe "#pick" do
    it "picks a random winner from the entrants" do
      winner = picks_winners.pick(entrants)

      expect(entrants).to include(winner)
    end
  end
end
