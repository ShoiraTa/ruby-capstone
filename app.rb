require './item'
require './classes/music_album'
require './classes/genre'
require './classes/book'
require './classes/label'
require './modules/music_album_module'
require './modules/genres_module'
require './modules/book_module'
require './modules/label_module'

class App
  include MusicAlbumModule
  include BooksDataController
  include LabelsDataController

  def initialize
    @books = load_books
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
      puts 'list_games'
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
      puts 'create_movies'
    end
  end

  def list_all_music_album
    puts 'Music Albums'
    @music_albums.each do |music_album|
      puts "Name: #{music_album.name}, Publish Date: #{music_album.publish_date}, On Spotify: #{music_album.on_spotify}"
    end
  end

  def list_all_genres
    puts 'Genres'
    @load_genres.each do |genre|
      puts "Genre name: #{genre.name}"
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
    puts 'There are no authors yet!' if @author.empty?
    @author.each do |author|
      puts "first name: #{author.first_name}, last name #{author.last_name}}"
    end
  end
end
