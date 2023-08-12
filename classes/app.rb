require_relative 'book'
require_relative 'label'
require_relative '../preserve_data/save_books_labels'

class App
  attr_accessor :books, :labels

  def initialize()
    @save = Save.new
    @books = @save.read_books
    @labels = @save.read_labels
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
    if @books.empty?
      puts 'There are no books yet..'
    else
      @books.each do |book|
        puts "Genre: #{book.genre} | Author: #{book.author} | Source: #{book.source} | Label: #{book.label} | Publish Date: #{book.publish_date} | Publisher: #{book.publisher}"
      end
    end
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
    if @labels.empty?
      puts 'There are no labels yet..'
    else
      @labels.each do |label|
        puts "Label title: #{label.title} | Color: #{label.color}"
      end
    end
  end

  def list_all_authors
    puts 'List of authors'
  end

  def list_all_sources
    puts 'List of sources'
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
    puts 'Add a new music album'
  end

  def add_a_game
    puts 'Add a new game'
  end
end
