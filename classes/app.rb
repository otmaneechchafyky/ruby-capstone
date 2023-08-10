require_relative '../handlers/collections/genres'
require_relative '../handlers/collections/music_albums'
require_relative '../modules/user_interface'

class App
  include UserInterface

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

  def initialize
    @genres = Genres.new(filename: 'genres.json')
    dependencies = { genres: @genres, authors: nil, sources: nil, labels: nil }
    @albums = MusicAlbums.new(filename: 'albums.json', dependencies: dependencies)
  end

  def run(option)
    send(OPTIONS[option])
  end

  def list_all_books
    puts 'List of books'
  end

  def list_all_music_albums
    @albums.list_all
  end

  def list_all_movies
    puts 'List of movies'
  end

  def list_all_games
    puts 'List of games'
  end

  def list_all_genres
    @genres.list_all
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
    print_title('Adding a MusicAlbum')
    puts "What 'Genre' the album is?"
    genre = @genres.create_new
    album_params = { genre: genre }
    @albums.create_new(album_params)
  end

  def add_a_game
    puts 'Add a new game'
  end

  def save
    instance_variables.each do |col|
      instance_variable_get(col).save if instance_variable_get(col).methods.include?(:save)
    end
  end
end
