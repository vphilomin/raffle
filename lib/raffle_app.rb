class RaffleApp
  def initialize(parser, runner_factory)
    @parser = parser
    @runner_factory = runner_factory
  end

  def run(argv)
    options = @parser.parse(argv)
    runner = @runner_factory.for_options(options)
    runner.run
  end
end
