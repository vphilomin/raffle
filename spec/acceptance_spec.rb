require 'fileutils'
require 'Open3'

describe 'acceptance', :acceptance, :aggregate_failures do
  def remove_raffle_files
    FileUtils.rm_rf Dir.glob('spec/*.raffle')
  end

  def run_app(command)
    Open3.capture3(command)
  end

  def lines
    @stdout.split("\n")
  end

  shared_examples_for "a raffle app" do
    it "exits successfully" do
      expect(@status.success?).to be true
    end

    it "has the correct number of output lines" do
      expect(lines.size).to eq(3)
    end

    it "contains the prize in each output line" do
      lines.each do |line|
        expect(line).to include(prize)
      end
    end
  end

  before(:each) { remove_raffle_files }

  let(:prize) { %(harry potter) }

  describe "picking winners" do
    before do
      @stdout, @stderr, @status = run_app "ruby lib/raffle.rb -n 3 spec/5names \"#{prize}\""
    end

    it_behaves_like "a raffle app"
  end

  describe "showing winners" do
    before do
      run_app "ruby lib/raffle.rb -n 3 spec/5names \"#{prize}\""
      @stdout, @stderr, @status = run_app "ruby lib/raffle.rb --winners spec/5names"
    end

    it_behaves_like "a raffle app"
  end

  after(:each) { remove_raffle_files }
end
