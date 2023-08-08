require 'json'
require_relative '../Classes/book'

module BookModule
  def load_books
    data = []
    file = './json_files/books.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |book|
        data.push(Book.new(book['author'], book['publisher'], book['cover_state'], book['publish_data']))
      end
    else
      File.write(file, [])
    end
    data
  end

  def create_book
    data = []
    @books.each do |book|
      data.push({ author: book.author, publisher: book.publisher, cover_state: book.cover_state,
                  publish_date: book.publish_date })
    end
    File.write('./json_files/books.json', JSON.pretty_generate(data))
  end
end
