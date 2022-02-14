require './app'

class Main
  def initialize
    @app = App.new
  end

  def options
    puts 'Please select 1 option below
        1 - List all books
        2 - List all music albums
        3 - List all movies
        4 - List all genres (e.g "Comedy", "Thriller")
        5 - List all labels (e.g "Gift", "New")
        6 - List all authors (e.g "Stephan King")
        7 - Add a book
        8 - Add music album
        9 - Add a movie
        10 - Exit
        '
  end

  def start
    input = 0
    puts 'Hello'
    while input.to_i < 10
      options
      input = gets.chomp
      @app.options_cases(input)
    end
    puts 'Thank you, bye!'
  end
end

main = Main.new
main.start