class ProvidesEntrantsFromFile
  def initialize(filename)
    @filename = filename
  end

  def provide
    File.readlines(filename).map(&:chomp)
  end

  private

  attr_reader :filename
end
