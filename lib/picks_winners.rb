require_relative 'picks_winner'

class PicksWinners
  def initialize(picks_winner, num_winners = 1)
    @picks_winner = picks_winner
    @num_winners = num_winners
  end

  def pick(entrants)
    raise ArgumentError, "too few entrants"  if entrants.length < num_winners
    num_winners.times do
      winner = picks_winner.pick(entrants)
      entrants.delete(winner)
      yield winner
    end
  end

  private

  attr_reader :picks_winner, :num_winners
end
