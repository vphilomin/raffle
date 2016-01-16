require_relative '../lib/runner_factory'

describe RunnerFactory do

  subject(:runner_factory) { RunnerFactory.new }

  let(:options) { spy(:[] => false) }

  describe ".for_options" do
    it { is_expected.to respond_to(:for_options) }

    it "returns the PickWinnersRunner when not showing past winners" do
      expect(runner_factory.for_options(options)).to be_a(PicksWinnersRunner)
    end

    it "returns the ShowPastWinnersRunner when showing past winners" do
      allow(options).to receive(:[]).with(:show_past_winners).and_return(true)

      expect(runner_factory.for_options(options)).to be_kind_of(ShowPastWinnersRunner)
    end
  end
end
