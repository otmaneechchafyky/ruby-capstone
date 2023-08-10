require_relative 'book'
require_relative 'label'
require_relative '../preserve_data/save_books_labels'
require_relative 'gameapp'
require_relative '../handlers/collections/genres'
require_relative '../handlers/collections/music_albums'
require_relative '../modules/user_interface'

class App
  include UserInterface
  attr_accessor :books, :labels

  OPTIONS = {
    '1' => :list_all_books,
    '2' => :list_all_music_albums,
    '3' => :list_all_games,
    '4' => :list_all_genres,
    '5' => :list_all_labels,
    '6' => :list_all_authors,
    '7' => :add_a_book,
    '8' => :add_a_music_album,
    '9' => :add_a_game
  }.freeze

  def initialize
    @save = Save.new
    @books = @save.read_books
    @labels = @save.read_labels
    @gameapp = GameApp.new
    @authors = @gameapp.load_authors
    @games = @gameapp.load_games
    @genres = Genres.new(filename: 'genres.json')
    dependencies = { genres: @genres, authors: nil, sources: nil, labels: nil }
    @albums = MusicAlbums.new(filename: 'albums.json', dependencies: dependencies)
  end

  def run(option)
    send(OPTIONS[option])
  end

  def list_all_books
    if @books.empty?
      puts 'There are no books yet..'
    else
      @books.each do |book|
        puts "Genre: #{book.genre} | Author: #{book.author} | Source: #{book.source} | Label: #{book.label} | Publish Date: #{book.publish_date} | Publisher: #{book.publisher}"
      end
    end
  end

  def list_all_music_albums
    @albums.list_all
  end

  def list_all_games
    @gameapp.list_all_games(@games)
  end

  def list_all_genres
    @genres.list_all
  end

  def list_all_labels
    if @labels.empty?
      puts 'There are no labels yet..'
    else
      @labels.each do |label|
        puts "Label title: #{label.title} | Color: #{label.color}"
      end
    end
  end

  def list_all_authors
    @gameapp.list_all_authors(@authors)
  end

  def add_a_book
    puts 'Add book genre'
    genre = gets.chomp
    puts 'Add book author'
    author = gets.chomp
    puts 'Add book source'
    source = gets.chomp
    puts 'Add book label'
    label = gets.chomp
    puts 'Add book publish date [Format (YYYY/MM/DD)]'
    publish_date = gets.chomp
    puts 'archive the book (Y/N)'
    archived = gets.chomp
    puts 'Add book publisher'
    publisher = gets.chomp
    puts 'Add book cover state'
    cover_state = gets.chomp

    if %w[Y y].include?(archived)
      archived_value = true
    elsif %w[N n].include?(archived)
      archived_value = false
    end

    params = {
      genre: genre,
      author: author,
      source: source,
      label: label,
      publish_date: publish_date,
      archived: archived_value,
      publisher: publisher,
      cover_state: cover_state
    }
    book = Book.new(params)
    puts 'Add a label color:'
    color = gets.chomp
    colorized_label = Label.new(label, color)
    @books << book
    @labels << colorized_label
    @save.save_books(@books)
    @save.save_labels(@labels)
    puts 'Book created successfully'
  end

  def add_a_music_album
    print_title('Adding a MusicAlbum')
    puts "What 'Genre' the album is?"
    genre = @genres.create_new
    album_params = { genre: genre }
    @albums.create_new(album_params)
  end

  def add_a_game
    author = @gameapp.add_author(@authors)
    game = @gameapp.add_game(@games)
    author.add_item(game)
  end

  def save
    instance_variables.each do |col|
      instance_variable_get(col).save if instance_variable_get(col).methods.include?(:save)
    end
    @gameapp.save_authors(@authors)
    @gameapp.save_games(@games)
  end
end
