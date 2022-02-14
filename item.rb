require 'date'

class Item
  attr_accessor :publish_date, :archived, :author, :id, :name
  attr_reader :label, :genre


  def initialize (id, name, genre, author, label, publish_date, archived = false)
    @id = id
    @name = name
    @genre = genre
    @archived = archived
    @author = author
    @label =  label
    @publish_date = Date.parse(publish_date)
  end



  def move_to_archive
    @archived = true if can_be_archived? 
  end

  def can_be_archived? 
    current_date = Date.today
    time_diff = current_date.year - @publish_date.year
    time_diff >= 10
  end

end