require './item'
require './music_album'
require './music_album_module'

class App
  include MusicAlbumModule
  
  def initialize
    @music_albums = load_music_albums
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

  def list_all_music_album
    puts 'Music Albums'
    @music_albums.each do |music_album|
      puts "Name: #{music_album.name}, Publish Date: #{music_album.publish_date}, On Spotify: #{music_album.on_spotify}"
    end
  end
  
end


