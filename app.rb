require './item'

class App
  def initialize
    @item_archive = Item.new(1, 'name', 'genre', 'author', 'label', '01.01.2001')
  end

  def options_cases(user_input)
    case user_input
    when '1'
      puts 'list_books'
    when '2'
      puts 'list_music_albums'
    when '3'
      puts 'list_movies'
    when '4'
      puts 'list_genres'
    when '5'
      puts 'list_labels'
    when '6'
      puts 'list_authors'
    when '7'
      puts 'create_book'
    when '8'
      puts 'create_music_album'
    when '9'
      puts 'create_movies'
    end
  end
  puts(@item_archive)
end
