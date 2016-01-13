require_relative '../lib/storing_output'

describe StoringOutput do
  subject(:output) { StoringOutput.new(std_output, store) }

  let(:std_output) { spy }
  let(:store) { spy }
  let(:winner) { "winner" }
  let(:prize) { "POODR" }

  describe "#announce" do

    it "stores the winner and prize on disk" do
      output.announce(winner, prize)

      expect(store).to have_received(:write).with(winner, prize)
    end

    it "delegates announcing to standard output" do
      output.announce(winner, prize)

      expect(std_output).to have_received(:announce).with(winner, prize)
    end
  end
end
