require_relative 'collection'
require_relative '../../classes/genre'
require_relative '../../modules/data_handler'

class Genres < Collection
  include DataHandler

  def initialize(params = {})
    super(params)
  end

  def create_new
    params = create_params
    genre = already_has(params)

    if genre
      say_already_exist('Genre', genre.name)
      return genre
    end

    say_creating('Genre')
    genre = Genre.new(params)
    @collection << genre
    say_created('Genre', params[:name])
    genre
  end

  def list_all
    return say_nothing_to_list('Genres') if empty?

    print_title('List all Genres')
    puts "#{'id'.ljust(10)} | #{'Name'.ljust(25)}"
    print_line
    super
  end

  private

  def create_params
    { name: ask_for('the Genre [name]') }
  end
end
