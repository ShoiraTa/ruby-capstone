require_relative './item'
class Game
  def initialize(publish_date, multiplayer, last_played_date)
    super(publish_date)
    @last_played_date = Date.new(last_played_date)
    @multiplayer = multiplayer
  end
end