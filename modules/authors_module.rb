require 'json'
require './classes/author'

module AuthorsModule
  def load_authors
    data = []
    file = './json_files/authors.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |author|
        data.push(Author.new(author['first_name'], author['last_name']))
      end
    else
      File.write(file, [])
    end

    data
  end

  def create_author
    data = []
    @music_albums.each do |author|
      data.push({ first_name: author.first_name, last_name: author.last_name })
    end
    open('./json_files/authors.json', 'w') { |f| f << JSON.generate(data) }
  end
end
