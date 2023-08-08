require './app'

# Ask the user for the choice
class Main
  def menu
    @options = {
      '1' => 'List all games',
      '2' => 'List all authors',
      '3' => 'Add a game',
      '0' => 'Exit App'
    }

    @options.each do |index, string|
      puts "#{index} - #{string}"
    end
    gets.chomp.to_i
  end
end

# handle the choices
def choice(user_answer, response)
  actions = {
    1 => :list_games,
    2 => :list_authors,
    3 => :add_game,
    0 => :exit_app
  }

  action = actions[user_answer]

  response.send(action)
end

def main
  response = App.new

  loop do
    puts 'Please choose an option by entering a number'
    user_answer = Main.new.menu
    choice user_answer, response
  end
end

main
