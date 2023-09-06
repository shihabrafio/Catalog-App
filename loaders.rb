class Loader
  def load_authors(authors)
    if File.exist?('./json_files/authors.json')
      JSON.parse(File.read('./json_files/authors.json')).each do |author|
        authors << author
      end
    else
      authors = []
    end
  end

  def load_games(games)
    if File.exist?('./json_files/games.json')
      JSON.parse(File.read('./json_files/games.json')).each do |game|
        games << game
      end
    else
      games = []
    end
  end
end
