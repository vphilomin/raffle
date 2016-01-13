class StoreNameProvider
  def initialize(entrants_filename)
    @entrants_filename = entrants_filename
  end

  def name
    "#{@entrants_filename}.raffle"
  end
end
