require_relative 'picks_winners_runner'
require_relative 'show_past_winners_runner'
require_relative 'provides_entrants_from_file'
require_relative 'picks_winners'
require_relative 'console_output'

class RunnerFactory
  def for_options(options)
    if (!options[:show_past_winners])
      PicksWinnersRunner.new(ProvidesEntrantsFromFile.new(options[:entrants_filename]),
                             PicksWinners.new,
                             ConsoleOutput.new,
                             options[:prize])
    else
      ShowPastWinnersRunner.new
    end
  end
end
