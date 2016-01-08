class ConsoleOutput
  def announce(winner, prize)
    p format_announcement(winner, prize)
  end

  def format_announcement(winner, prize)
    "#{winner}: #{prize}"
  end
end
