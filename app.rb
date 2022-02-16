require './item'
require './classes/music_album'
require './classes/game'
require './classes/genre'
require './classes/author'
require './modules/music_album_module'
require './modules/genres_module'
require './modules/games_module'
require './modules/authors_module'

class App
  include MusicAlbumModule
  include GamesModule
  include AuthorsModule

  def initialize
    @authors = load_authors
    @games = load_games
    @music_albums = load_music_albums
    @load_genres = load_genres
  end

  def options_cases(user_input)
    case user_input
    when '1'
      puts 'list_books'
    when '2'
      list_all_music_album
    when '3'
      list_all_games
    when '4'
      list_all_genres
    when '5'
      puts 'list_labels'
    when '6'
      list_all_authors
    when '7'
      puts 'create_book'
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
end
