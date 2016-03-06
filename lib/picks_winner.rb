require 'securerandom'

class PicksWinner
  def pick entrants
    entrants[SecureRandom.random_number(entrants.length)]
  end
end
