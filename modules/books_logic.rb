require 'json'
require_relative '../classes/book'

module BookModule
  def read_book
    data = []
    file = './json_files/books.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |book|
        data.push(Book.new(book['publisher'], book['cover_state'], book['publish_date']))
    end
    else
        File.write(file,[])
    end
  end

  def write_book
    data = []
    @books.each do |book|
        data.push({ 'publisher' => book.publisher, 'cover_state' => book.cover_state, 'publish_date' => book.publish_date })
  end
  File.write('./json_files/books.json', JSON.pretty_generate(data))
  end
end
