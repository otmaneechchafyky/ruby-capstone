require_relative 'author'
require_relative 'game'
require 'json'

class GameApp
  def load_authors
    return [] unless File.exist?('data/authors.json')

    authors = []
    authors_data = JSON.parse(File.read('data/authors.json'))
    authors_data.each do |author_data|
      author = Author.new(first_name: author_data['first_name'], last_name: author_data['last_name'])
      author.id = author_data['id']
      authors << author
    end
    authors
  end

  def load_games
    return [] unless File.exist?('data/games.json')

    games = []
    games_data_json = File.read('data/games.json')
    games_data = JSON.parse(games_data_json, symbolize_names: true)
    games_data.each do |game_data|
      game = Game.new(
        multiplayer: game_data[:multiplayer],
        played_at_date: game_data[:played_at_date]
      )
      games << game
    end
    games
  end

  # Save authors to a JSON file
  def save_authors(authors)
    File.open('data/authors.json', 'w') do |_file|
      File.write('data/authors.json', JSON.pretty_generate(authors.map(&:to_hash)))
    end
    puts 'Author Data saved to file successfully'
  rescue StandardError => e
    puts "Error saving data to file: #{e.message}"
  end

  # Save games to a JSON file
  def save_games(games)
    File.open('data/games.json', 'w') do |_file|
      File.write('data/games.json', JSON.pretty_generate(games.map(&:to_hash)))
    end
    puts 'Game Data saved to file successfully'
  rescue StandardError => e
    puts "Error saving data to file: #{e.message}"
  end

  def add_author(authors, full_params)
    first_name = full_params[:first_name]
    last_name = full_params[:last_name]

    existing_author = find_existing_author(authors, first_name, last_name)
    if existing_author
      puts 'Existing author found'
      author = existing_author
    else
      puts 'Creating new author'
      author = Author.new(first_name: first_name, last_name: last_name)
      authors << author
    end
    author
  end

  # Add games
  def add_game(games, full_params)
    game = Game.new(full_params)
    games << game
    puts 'Game Added Successfully.'
    game
  end

  def list_all_games(games)
    if games.empty?
      puts 'No Game Record Found'
    else
      puts 'List of games:'
      games.each_with_index do |game, index|
        puts "#{index + 1}. Multiplayer: #{game.multiplayer}, Last Played Date: #{game.played_at_date}"
      end
    end
  end

  def list_all_authors(authors)
    if authors.empty?
      puts 'No Author Record Found'
    else
      puts 'List of Authors:'
      authors.each do |author|
        puts "ID: #{author.id}. FullName: #{author.first_name} #{author.last_name}"
      end
    end
  end

  def find_existing_author(authors, first_name, last_name)
    existing_author = nil

    authors.each do |author|
      if author.first_name == first_name && author.last_name == last_name
        existing_author = author
        break
      end
    end

    existing_author
  end
end
