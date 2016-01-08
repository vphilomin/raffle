require 'optparse'

class Parser
  def initialize
    @options = {}
  end

  def parse(args)
    set_default_options

    parse_flag_options!(args)

    parse_nonflag_options(args)

    options
  end

  private

  attr_accessor :options

  def set_default_options
    options[:winner_count] = 1
    options[:show_past_winners] = false
  end

  def parse_flag_options!(args)
    opt_parser = OptionParser.new do |opts|
      opts.on("-n NUMBER OF WINNERS", Integer, "Number of winners to pick") do |n|
        options[:winner_count] = n
      end

      opts.on("--winners", "Show past winners") do |w|
        options[:show_past_winners] = true
      end
    end

    opt_parser.parse!(args)
  end

  def parse_nonflag_options(args)
    options[:entrants_filename] = args[0]
    options[:prize] = args[1]
  end
end
