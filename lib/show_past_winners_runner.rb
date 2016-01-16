class ShowPastWinnersRunner
  def initialize(store, output)
    @store = store
    @output = output
  end

  def run
    winners = @store.read
    winners.each do |winner, prize|
      @output.announce(winner, prize)
    end
  end
end
