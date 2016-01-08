require_relative 'raffle_app'
require_relative 'parser'
require_relative 'runner_factory'

RaffleApp.new(Parser.new, RunnerFactory.new).run(ARGV)
