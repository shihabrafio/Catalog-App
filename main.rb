require_relative 'Classes/options'

def main
  app = App.new
  app.load

  options = Options.new

  loop do
    options.choices
    puts 'Enter an option'
    input = gets.chomp.to_i
    break if input.zero?

    app.executors(input)
  end

  app.save
end

main
