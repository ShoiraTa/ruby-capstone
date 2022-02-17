require_relative './item'
require_relative './classes/music_album'
require_relative './classes/game'
require_relative './classes/genre'

require_relative './classes/book'
require_relative './classes/label'
require_relative './modules/music_album_module'
require_relative './modules/genres_module'
require_relative './modules/book_module'
require_relative './modules/label_module'
require_relative './modules/games_module'
require_relative './modules/authors_module'

class App
  include MusicAlbumModule
  include BooksDataController
  include LabelsDataController
  include GamesModule
  include AuthorsModule

  def initialize
    @books = load_books
    @authors = load_authors
    @games = load_games
    @music_albums = load_music_albums
    @load_genres = load_genres
    @add_book_details = load_books
    @labels = load_labels
  end

  def options_cases(user_input)
    case user_input
    when '1'
      list_books
    when '2'
      list_all_music_album
    when '3'
      list_all_games
    when '4'
      list_all_genres
    when '5'
      list_labels
    when '6'
      list_authors
    when '7'
      add_book
    when '8'
      add_music_album
    when '9'
      add_game
    end
  end

  def list_all_music_album
    puts 'Music Albums'
    @music_albums.each do |music_album|
      puts "Name: #{music_album.name}, Publish Date: #{music_album.publish_date}, On Spotify: #{music_album.on_spotify}"
    end
  end

  def list_all_games
    puts 'Music Albums:'
    @games.each do |games|
      puts "Multiplayer: #{games.multiplayer}, Publish Date: #{games.publish_date},
      Last played date: #{games.last_played_date}"
    end
  end

  def list_all_genres
    puts 'Genres:'
    @load_genres.each do |genre|
      puts "Genre name: #{genre.name}"
    end
  end

  def list_all_authors
    puts 'Authors:'
    @authors.each do |author|
      puts "First Name: #{author.first_name} "
      puts "Last Name: #{author.last_name} "
    end
  end

  def add_music_album
    puts 'Album name: '
    name = gets.chomp

    puts 'Date of publish [Enter date in format (yyyy-mm-dd)]'
    publish_date = gets.chomp

    puts 'Is it available on Spotify? Y/N'
    on_spotify = gets.chomp.downcase == 'y' || false

    @music_albums.push(MusicAlbum.new(name, publish_date, on_spotify))
    puts 'Music album created'
  end

  def add_game
    puts 'Please write multiplayer: '
    multiplayer = gets.chomp

    puts 'Please write date of publish [Enter date in format (yyyy-mm-dd)]'
    publish_date = gets.chomp

    puts 'Please write last played date [Enter date in format (yyyy-mm-dd)]'
    last_played_date = gets.chomp

    @games.push(Game.new(multiplayer, publish_date, last_played_date))
    puts 'Game is created'
  end

  def add_book
    print 'Please, type the book title: '
    title = gets.chomp

    print 'Please, type the book publisher: '
    publisher = gets.chomp

    print 'Please, type the book cover state: '
    cover_state = gets.chomp

    print 'Date of publish [Enter date in format (yyyy-mm-dd)]: '
    publish_date = gets.chomp
    return unless publish_date

    @books.push(Book.new(title, publisher, cover_state, publish_date))
    puts 'Book created successfully'
  end

  def list_books
    puts 'There are no books yet! Please add books.' if @books.empty?
    @books.each do |book|
      puts "Name: #{book.name}, Publish Date: #{book.publish_date}, cover_state: #{book.cover_state}"
    end
  end

  def list_labels
    puts 'There are no labels yet!' if @labels.empty?
    @labels.each do |label|
      puts "ID: #{label['id']}, Title: #{label['title']}, Color: #{label['color']}"
    end
  end

  def list_authors
    puts 'There are no authors yet!' if @authors.empty?
    @authors.each do |author|
      puts "first name: #{author.first_name}, last name #{author.last_name}}"
    end
  end
end
