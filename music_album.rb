require './item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(name, publish_date, on_spotify)
    super(id, name, publish_date)
    @name = name
    @on_spotify = on_spotify
  end

  def can_archived?
    super and @on_spotify
  end
end
