require_relative 'classes/app'

def list_options
  list = [
    "\n",
    'Please choose an option by entering a number (1-10):',
    '1 - List all books',
    '2 - List all music albums',
    '3 - List all games',
    '4 - List all genres',
    '5 - List all labels',
    '6 - List all authors',
    '7 - Add a new book',
    '8 - Add a new music album',
    '9 - Add a new game',
    '10 - Exit'
  ]

  puts list
  gets.chomp
end

def main
  cm_app = App.new
  cm_app.print_title('Welcome to Catalog manager App!')

  loop do
    number = list_options

    case number
    when '1', '2', '3', '4', '5', '6', '7', '8', '9'
      cm_app.run(number)
    when '10'
      cm_app.save
      cm_app.print_line
      puts 'Thank you for using this app!'
      break
    else
      cm_app.say_invalid('input')
    end
  end
end

main
