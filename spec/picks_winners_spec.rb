require_relative '../lib/picks_winners'

describe PicksWinners do
  subject(:picks_winners) { PicksWinners.new(picks_winner, num_winners) }

  let(:picks_winner) { instance_spy(PicksWinner) }
  let(:num_winners) { 2 }
  let(:entrants) { ["A", "B", "C"] }
  let(:winner1) { "B" }
  let(:winner2) { "A" }
  let(:entrants_without_first_winner) { ["A", "C"] }

  describe "#pick" do
    it "yields exactly num_winners times" do
      expect { |b| picks_winners.pick(entrants, &b) }.to yield_control.exactly(num_winners).times
    end

    it "yields with non-repetitive winners returned by picks_winner" do
      allow(picks_winner).to receive(:pick).with(entrants).and_return(winner1)
      allow(picks_winner).to receive(:pick).with(entrants_without_first_winner).and_return(winner2)

      expect { |b| picks_winners.pick(entrants, &b) }.to yield_successive_args(winner1, winner2)
    end

    context "when fewer entrants than expected winners" do
      let(:num_winners) { 4 }

      it "raises an ArgumentError" do
        expect { picks_winners.pick(entrants) }.to raise_error(ArgumentError, "too few entrants")
      end
    end
  end
end
