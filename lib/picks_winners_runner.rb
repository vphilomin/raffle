class PicksWinnersRunner
  def initialize(provides_entrants, picks_winners, output, prize)
    @provides_entrants = provides_entrants
    @picks_winners = picks_winners
    @output = output
    @prize = prize
  end

  def run
    entrants = provides_entrants.provide
    picks_winners.pick(entrants) do |winner|
      output.announce(winner, prize)
    end
  end

  private
  
  attr_reader :provides_entrants, :picks_winners, :output, :prize
end
