require './Classes/author'
require './Classes/game'
require './Classes/book'
require './Classes/label'
require './Classes/genre'
require './loaders'
require './modules/book_logic'
require './modules/label_logic'
require './Classes/music'
require 'json'

class App
  puts "Welcome to The Content Hub!\n\n"
  include BookModule
  include LabelModule
  def initialize
    @authors = []
    @games = []
    @books = load_books
    @labels = load_labels
    @albums = []  # Make sure @albums is defined

    loader = Loader.new
    loader.load_authors(@authors)
    loader.load_games(@games)
  end
  def save
    create_book
    create_label
  end

  def list_authors
    if @authors.empty?
      puts 'There are no Authors yet'
    else
      @authors.each do |hash|
        print "Class: #{hash['class']}, Game ID : #{hash['game']}, "
        print "Author Name: #{hash['first_name']} #{hash['last_name']}"
        puts ''
      end
    end
  end

  def list_games
    if @games.empty?
      puts 'There are no games yet'
    else
      @games.each do |hash|
        print "Class: #{hash['class']}, Game ID : #{hash['game_id']}, "
        print "Multiplayer: #{hash['multiplayer']}, Last Played: #{hash['last_played_at']}"
        puts ''
      end
    end
  end

  def list_books
    puts 'There are no books yet!' if @books.empty?
    @books.each do |book|
      puts "Publisher: #{book.publisher}, Publish Date: #{book.publish_date}, Cover state: #{book.cover_state}"
    end
  end

  def list_labels
    puts 'no labels yet!' if @labels.empty?
    @labels.each do |label|
      puts "Title: #{label.title}, color: #{label.color}"
    end
  end

  def add_author(item)
    print('First Name : ')
    first_name = gets.chomp
    print('Last Name : ')
    last_name = gets.chomp

    author = Author.new(first_name, last_name)
    author.add_item(item)
    author_hash = {
      'first_name' => author.instance_variable_get('@first_name'),
      'last_name' => author.instance_variable_get('@last_name'),
      'game' => item.instance_variable_get('@id'),
      'class' => author.class
    }
    @authors << author_hash

    puts 'Author was created successfully'
  end

  def add_game
    puts 'Creating game..Add details below.'
    print 'Multiplayer? : '
    multipayer = gets.chomp

    print 'Last Played : '
    last_played_at = gets.chomp

    game = Game.new(1)
    game.add_game(multipayer, last_played_at)
    game_hash = {
      'game_id' => game.instance_variable_get('@id'),
      'multiplayer' => game.instance_variable_get('@multiplayer'),
      'last_played_at' => game.instance_variable_get('@last_played_at'),
      'class' => game.class
    }
    @games << game_hash

    add_author(game)
    puts 'Game created successfully'
  end

  def add_book
    puts 'Please enter the title of the book:'
    title = gets.chomp
    puts 'Please enter the publish date of the book'
    publish_date = gets.chomp
    puts 'Enter the color name'
    color = gets.chomp
    puts 'Enter the author\'s name'
    author = gets.chomp
    puts 'Please enter the Publisher of the book'
    publisher = gets.chomp
    puts 'Please enter the cover state of the book(eg. good, bad)'
    cover_state = gets.chomp
    puts 'book created'
    book = Book.new(author, publisher, cover_state, publish_date)
    @books.push(book)
    @labels.push(Label.new(title, color))
  end

  def add_music_album
    puts 'Creating a music album... Add details below.'
    print 'Album Name: '
    name = gets.chomp

    print 'Publish Date: '
    publish_date = gets.chomp

    print 'Cover State (good, bad, etc.): '
    cover_state = gets.chomp

    print 'On Spotify (true/false): '
    on_spotify = gets.chomp.downcase == 'true'

    print 'Archived (true/false): '
    archived = gets.chomp.downcase == 'true'

    album = MusicAlbum.new(name, publish_date, cover_state, on_spotify, archived: archived)
    @albums << album

    puts 'Music album created successfully'
  end
  # exit function
  def exit_app
    File.write('./json_files/authors.json', JSON.generate(@authors)) if @authors.size.positive?
    File.write('./json_files/games.json', JSON.generate(@games)) if @games.size.positive?
    save
    puts 'Thank you for using this app!'
    exit
  end
end
