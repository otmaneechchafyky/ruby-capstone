# frozen_string_literal: true

def list_all_books
  puts 'List of books'
end

def list_all_music_albums
  puts 'List of music albums'
end

def list_all_movies
  puts 'List of movies'
end

def list_all_games
  puts 'List of games'
end

def list_all_genres
  puts 'List of genres'
end

def list_all_labels
  puts 'List of labels'
end

def list_all_authors
  puts 'List of authors'
end

def list_all_sources
  puts 'List of sources'
end

def add_a_book
  puts 'Add a new book'
end

def add_a_music_album
  puts 'Add a new music album'
end

def add_a_game
  puts 'Add a new game'
end

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
  loop do
    number = list_options

    case number
    when '1'
      list_all_books
    when '2'
      list_all_music_albums
    when '3'
      list_all_movies
    when '4'
      list_all_games
    when '5'
      list_all_genres
    when '6'
      list_all_labels
    when '7'
      list_all_authors
    when '8'
      list_all_sources
    when '9'
      add_a_book
    when '10'
      add_a_music_album
    when '11'
      add_a_game
    when '12'
      puts 'Thank you for using this app!'
      break
    else
      puts 'Invalid input'
    end
  end
end

main
