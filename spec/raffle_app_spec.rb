require_relative '../lib/raffle_app'

describe RaffleApp do
  subject(:app) { RaffleApp.new(parser, runner_factory) }

  let(:parser) { spy }
  let(:runner_factory) { spy }
  let(:runner) { spy }

  describe '#run' do
    it "runs the appropriate runner based on the parsed arguments" do
      args = double(:args)
      options = double(:options)
      allow(parser).to receive(:parse).with(args) { options }
      allow(runner_factory).to receive(:for_options).with(options) { runner }

      app.run(args)

      expect(runner).to have_received(:run)
    end
  end
end
