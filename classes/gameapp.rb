require_relative 'author'
require_relative 'game'
require 'json'

class GameApp
  def initialize
    @authors = []
    @games = []
  end

  def load_authors
    return unless File.exist?('data/authors.json')

    authors_data = JSON.parse(File.read('data/authors.json'))
    authors_data.each do |author_data|
      author = Author.new(first_name: author_data['first_name'], last_name: author_data['last_name'])
      author.id = author_data['id']
      @authors << author
    end
  end

  def load_games
    return unless File.exist?('data/games.json')

    games_data_json = File.read('data/games.json')

    games_data = JSON.parse(games_data_json, symbolize_names: true)
    games_data.each do |game_data|
      game = Game.new(
        multiplayer: game_data[:multiplayer],
        played_at_date: game_data[:played_at_date]
      )
      @games << game
    end
  end

  # Save authors to a JSON file
  def save_authors
    File.open('data/authors.json', 'w') do |_file|
      File.write('data/authors.json', JSON.pretty_generate(@authors.map(&:to_hash)))
    end
    puts 'Author Data saved to file successfully'
  rescue StandardError => e
    puts "Error saving data to file: #{e.message}"
  end

  # Save games to a JSON file
  def save_games
    File.open('data/games.json', 'w') do |_file|
      File.write('data/games.json', JSON.pretty_generate(@games.map(&:to_hash)))
    end
    puts 'Game Data saved to file successfully'
  rescue StandardError => e
    puts "Error saving data to file: #{e.message}"
  end

  def add_game_and_associate_with_author
    print 'Enter author First Name: '
    first_name = gets.chomp
    print 'Enter author Last Name: '
    last_name = gets.chomp

    existing_author = find_existing_author(first_name, last_name)
    if existing_author
      puts 'Existing author found'
      author = existing_author
    else
      puts 'Creating new author'
      author = Author.new(first_name: first_name, last_name: last_name)
      @authors << author
      save_authors
    end
    author
  end

  # Add games
  def add_game
    print 'Is the game multiplayer? (true/false): '
    multiplayer = gets.chomp.downcase == 'true'
    print 'Enter the last played date (YYYY-MM-DD): '
    last_played_date = Date.parse(gets.chomp)
    game = Game.new(
      multiplayer: multiplayer,
      played_at_date: last_played_date
    )
    author = @authors.last
    game.associate_with_author(author)
    author.add_item(game)
    @games << game
    puts 'Game with Author Added Successfully.'
    save_games
  end

  def list_all_games
    if @games.empty?
      puts 'No Game Record Found'
    else
      puts 'List of games:'
      @games.each_with_index do |game, index|
        puts "#{index + 1}. Multiplayer: #{game.multiplayer}, Last Played Date: #{game.played_at_date}"
      end
    end
  end

  def list_all_authors
    if @authors.empty?
      puts 'No Author Record Found'
    else
      puts 'List of Authors:'
      @authors.each do |author|
        puts "ID: #{author.id}. FullName: #{author.first_name} #{author.last_name}"
      end
    end
  end

  def find_existing_author(first_name, last_name)
    existing_author = nil

    @authors.each do |author|
      if author.first_name == first_name && author.last_name == last_name
        existing_author = author
        break
      end
    end

    existing_author
  end
end
