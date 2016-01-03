require_relative '../lib/raffle_app'

describe RaffleApp do
  subject(:app) { RaffleApp.new(parser, runner_factory) }

  let(:parser) { spy }
  let(:runner_factory) { spy }

  describe '#run' do
    it "delegates picking the runner to the runner factory based on the parsed results" do
      args = double(:args)
      options = double(:options)
      allow(parser).to receive(:parse).with(args) { options }

      app.run(args)

      expect(runner_factory).to have_received(:for_options).with(options)
    end
  end
end
