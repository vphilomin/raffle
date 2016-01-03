require_relative 'pick_winners_runner'
require_relative 'show_past_winners_runner'

class RunnerFactory
  def for_options(options)
    if (!options[:show_past_winners])
      PickWinnersRunner.new
    else
      ShowPastWinnersRunner.new
    end
  end
end
