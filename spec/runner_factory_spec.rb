require_relative '../lib/runner_factory'

describe RunnerFactory do

  subject(:runner_factory) { RunnerFactory.new }

  describe ".for_options" do
    it { is_expected.to respond_to(:for_options) }

    it "returns the PickWinnersRunner when not showing past winners" do
      options = double(:[] => false)

      expect(runner_factory.for_options(options)).to be_a(PickWinnersRunner)
    end

    it "returns the ShowPastWinnersRunner when showing past winners" do
      options = double
      allow(options).to receive(:[]).with(:show_past_winners).and_return(true)

      expect(runner_factory.for_options(options)).to be_kind_of(ShowPastWinnersRunner)
    end
  end
end
