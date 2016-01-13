require_relative 'picks_winners_runner'
require_relative 'show_past_winners_runner'
require_relative 'provides_entrants_from_file'
require_relative 'picks_winners'
require_relative 'console_output'
require_relative 'yaml_store'
require_relative 'store_name_provider'
require_relative 'storing_output'

class RunnerFactory
  def for_options(options)
    if (!options[:show_past_winners])
      PicksWinnersRunner.new(ProvidesEntrantsFromFile.new(options[:entrants_filename]),
                             PicksWinners.new,
                             StoringOutput.new(
                                ConsoleOutput.new,
                                YamlStore.new(
                                  StoreNameProvider.new(options[:entrants_filename]))),
                             options[:prize])
    else
      ShowPastWinnersRunner.new
    end
  end
end
