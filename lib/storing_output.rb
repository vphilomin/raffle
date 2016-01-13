class StoringOutput
  def initialize(output, store)
    @output = output
    @store = store
  end

  def announce(winner, prize)
    @store.write(winner, prize)
    @output.announce(winner, prize)
  end
end
