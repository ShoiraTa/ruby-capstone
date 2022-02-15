require 'json'
require './music_album'

module MusicAlbumModule
  def load_music_albums
    data = []
    file = './music_album.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |music|
        data.push(MusicAlbum.new(music['name'], music['publish_date'], music['on_spotify']))
      end
    end
    # File.write(file, [])
    data
  end
end
