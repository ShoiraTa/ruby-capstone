require './classes/book'
require 'json'
require 'date'

module BooksDataController
  def load_books
    file = './json_files/books.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |element|
        data.push(Book.new(element['name'], element['publisher'], element['cover_state'], element['publish_date']))
      end
    end
    data
  end

  def save_books
    # data = []
    # @books.each do |book|
    #   data.push({ name: book.name, publisher: book.publisher, cover_state: book.cover_state,
    #               publish_date: book.publish_date })
    # end
    # File.write('./json_files/books.json', JSON.generate(data))
  end
end
