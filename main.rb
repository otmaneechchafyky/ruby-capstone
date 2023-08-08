require_relative 'app'

def list_options
  list = "
    Please choose an option by entering a number (1-12):
    1 - List all books
    2 - List all music albums
    3 - List all movies
    4 - List all games
    5 - List all genres
    6 - List all labels
    7 - List all authors
    8 - List all sources
    9 - Add a new book
    10 - Add a new music album
    11 - Add a new game
    12 - Exit
    "
  puts list
  gets.chomp
end

def main
  puts 'Welcome to Catalog manager App!'
  cm_app = App.new
  loop do
    number = list_options

    case number
    when '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11'
      cm_app.run(number)
    when '12'
      puts 'Thank you for using this app!'
      break
    else
      puts 'Invalid input'
    end
  end
end

main
