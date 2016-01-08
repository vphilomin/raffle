require_relative '../lib/console_output'

describe ConsoleOutput do
  subject(:output) { ConsoleOutput.new }

  let(:winner) { "Mr. A" }
  let(:prize) { "$20000" }

  describe "#format_announcement" do
    it "concats the winner and prize" do
      result = output.format_announcement(winner, prize)

      expect(result).to eq("Mr. A: $20000")
    end
  end
end
