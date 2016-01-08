require 'securerandom'

class PicksWinners
  def pick entrants
    entrants[SecureRandom.random_number(entrants.length)]
  end
end
