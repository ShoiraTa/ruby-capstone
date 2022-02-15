require_relative '../classes/author'
require_relative '../classes/label'
require_relative '../classes/genre'
require_relative './utils/input'

module Associations
  def attach_info(game)
    label = create_label
    genre = create_genre
    author = create_author
    author.add_item(game)
    label.add_item(game)
    genre.add_item(game)
    game
  end

  private

  def get_label(title, color)
    label = @label_list.find { |l| l.title == title && l.color == color }
    unless label
      label = Label.new(title, color)
      @label_list << label
    end
    label
  end

  def get_genre(name)
    genre = @genres_list.find { |g| g.name == name }
    unless genre
      genre = Genre.new(name)
      @genres_list << genre
    end
    genre
  end

  def get_author(first_name, last_name)
    author = @authors_list.find { |a| a.first_name == first_name && a.last_name == last_name }
    unless author
      author = Author.new(first_name, last_name)
      @authors_list << author
    end
    author
  end

  def create_label
    title = ask_text('Label Title')
    color = ask_text('Label Color')
    get_label(title, color)
  end

  def create_author
    first_name = ask_text('Author First Name')
    last_name = ask_text('Author Last Name')
    get_author(first_name, last_name)
  end

  def create_genre
    genre = ask_text('Genre')
    get_genre(genre)
  end
end