require 'date'

class Item
  attr_accessor :publish_date, :archived, :id, :name
  attr_reader :label, :genre, :author

  def initialize(id, name, publish_date, archived = false)
    @id = id || Random.rand(1..100)
    @name = name
    @archived = archived
    @publish_date = Date.parse(publish_date)
  end

  def can_be_archived?
    current_date = Date.today
    time_diff = current_date.year - @publish_date.year
    time_diff >= 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end
end
