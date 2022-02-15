require './item'
require './classes/music_album'
require './classes/genre'
require './modules/music_album_module'
require './modules/genres_module'

class App
  include MusicAlbumModule

  def initialize
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
      puts 'list_games'
    when '4'
      list_all_genres
    when '5'
      puts 'list_labels'
    when '6'
      puts 'list_authors'
    when '7'
      puts 'create_book'
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
end
