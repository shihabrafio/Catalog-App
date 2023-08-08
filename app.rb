require './Classes/author'
require './Classes/game'
require './loaders'
require 'json'

class App
  puts "Welcome to The Content Hub!\n\n"
  def initialize
    @authors = []
    @games = []

    loader = Loader.new
    loader.load_authors(@authors)
    loader.load_games(@games)
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

  # exit function
  def exit_app
    File.write('./json_files/authors.json', JSON.generate(@authors)) if @authors.size.positive?
    File.write('./json_files/games.json', JSON.generate(@games)) if @games.size.positive?
    puts 'Thank you for using this app!'
    exit
  end
end
