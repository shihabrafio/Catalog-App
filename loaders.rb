class Loader
  def load_authors(authors)
    if File.exist?('./json files/@authors.json')
      JSON.parse(File.read('./json files/@authors.json')).each do |author|
        authors << author
      end
    else
      authors = []
    end
  end

  def load_books(books)
    if File.exist?('./json files/books.json')
      JSON.parse(File.read('./json files/books.json')).each do |book|
        books << book
      end
    else
      books = []
    end
  end

  def load_labels(labels)
    if File.exist?('./json files/labels.json')
      JSON.parse(File.read('./json files/labels.json')).each do |label|
        labels << label
      end
    else
      labels = []
    end
  end

  def load_games(games)
    if File.exist?('./json files/@games.json')
      JSON.parse(File.read('./json files/@games.json')).each do |game|
        games << game
      end
    else
      games = []
    end
  end

  def load_musics(_musics)
    if File.exist?('./json files/music.json')
      JSON.parse(File.read('./json files/music.json')).each do |music|
        music_albums << music
      end
    else
      _musics = []
    end
  end

  def load_genres(genres)
    if File.exist?('./json files/genres.json')
      JSON.parse(File.read('./json files/genres.json')).each do |genre|
        genres << genre
      end
    else
      genres = []
    end
  end
end
