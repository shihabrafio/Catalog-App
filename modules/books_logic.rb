module BookModule
  def create_book(_book)
    data = []
    file = './json_files/books.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |book|
        data.push(Book.new(book['publisher'], book['cover_state'], book['publish_date']))
      end
    else
      File.write(file, [])
    end
  end
end
