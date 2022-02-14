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
        4 - List of games
        5 - List all genres (e.g "Comedy", "Thriller")
        6 - List all labels (e.g "Gift", "New")
        7 - List all authors (e.g "Stephan King")
        8 - List all sources (e.g "From a friend", "online shop")
        9 - Add a book
        10 - Add music album
        11 - Add a game
        12 - Add a movie
        13 - Exit
        '
    end

    def start
    input = 0
        puts 'Hello'
        while input.to_i < 12
            options
        input = gets.chomp
        @app.options_cases(input)
        end
    end
end


main = Main.new
main.start