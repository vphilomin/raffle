class StoreNameProvider
  def initialize(entrants_filename)
    @entrants_filename = entrants_filename
  end

  def name
    "#{entrants_filename}.raffle"
  end

  private

  attr_reader :entrants_filename
end
