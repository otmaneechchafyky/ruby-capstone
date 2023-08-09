require_relative 'game/gameapp'
class App
  def initialize
    @gameapp = GameApp.new
    @gameapp.load_authors
    @gameapp.load_games
  end
  OPTIONS = {
    '1' => :list_all_books,
    '2' => :list_all_music_albums,
    '3' => :list_all_movies,
    '4' => :list_all_games,
    '5' => :list_all_genres,
    '6' => :list_all_labels,
    '7' => :list_all_authors,
    '8' => :list_all_sources,
    '9' => :add_a_book,
    '10' => :add_a_music_album,
    '11' => :add_a_game
  }.freeze

  def run(option)
    send(OPTIONS[option])
  end

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
    @gameapp.list_all_games
  end

  def list_all_genres
    puts 'List of genres'
  end

  def list_all_labels
    puts 'List of labels'
  end

  def list_all_authors
    @gameapp.list_all_authors
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
    @gameapp.add_game_and_associate_with_author
    @gameapp.add_game
  end
end
