require_relative 'book'
require_relative 'label'
require_relative 'author'
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
    print_title('Adding a Book')
    full_params = ask_for_params('Book')
    book = Book.new(full_params)
    colorized_label = Label.new(full_params)
    genre = @genres.create_new(full_params)
    author = @gameapp.add_author(@authors, full_params)
    @books << book
    @labels << colorized_label
    colorized_label.add_item(book)
    genre.add_item(book)
    author.add_item(book)
    puts 'Book created successfully'
  end

  def add_a_music_album
    print_title('Adding a MusicAlbum')
    full_params = ask_for_params('MusicAlbum')
    genre = @genres.create_new(full_params)
    label = Label.new(full_params)
    author = @gameapp.add_author(@authors, full_params)
    album = @albums.create_new(full_params)
    author.add_item(album)
    genre.add_item(album)
    label.add_item(album)
  end

  def add_a_game
    print_title('Adding a Game')
    full_params = ask_for_params('Game')
    author = @gameapp.add_author(@authors, full_params)
    genre = @genres.create_new(full_params)
    label = Label.new(full_params)
    game = @gameapp.add_game(@games, full_params)
    author.add_item(game)
    genre.add_item(game)
    label.add_item(game)
  end

  def save
    @save.save_books(@books)
    @save.save_labels(@labels)
    @gameapp.save_authors(@authors)
    @gameapp.save_games(@games)
    instance_variables.each do |col|
      instance_variable_get(col).save if instance_variable_get(col).methods.include?(:save)
    end
  end

  def ask_for_params(type)
    all_params = {}
    all_params[:publish_date] = ask_for("the #{type} [publish date] (yyyy-mm-dd)")

    case type
    when 'Book'
      all_params[:publisher] = ask_for('the Book [publisher]')
      all_params[:cover_state] = ask_for('the Book [cover state]')
    when 'Game'
      all_params[:multiplayer] = true_false(ask_for('if Game is [multiplayer] (y/n)?'))
      all_params[:played_at_date] = ask_for('when the Game was [last played at] (yyyy-mm-dd)')
    when 'MusicAlbum'
      all_params[:on_spotify] = true_false(ask_for('if MusicAlbum is [on spotify] (y/n)?'))
    end

    all_params[:first_name] = ask_for('the Author [first name]')
    all_params[:last_name] = ask_for('the Author [last name]')
    all_params[:name] = ask_for('the Genre [name]')
    all_params[:title] = ask_for('the Label [title]')
    all_params[:color] = ask_for('the Label [color]')

    all_params
  end
end
