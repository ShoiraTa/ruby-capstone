require 'date'
require_relative '../item'


class Game < Item
  attr_accessor :multiplayer, :last_played_date, :publish_date

  def initialize(multiplayer, last_played_date, publish_date)
    super(id, name, publish_date)
    @last_played_date = Date.parse(last_played_date)
    @multiplayer = multiplayer
  end

  def can_be_archived?
    duration = Time.now.year - @last_played_date.year
    super && duration > 2
  end
end
