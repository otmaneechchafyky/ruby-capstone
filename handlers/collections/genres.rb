require_relative 'collection'
require_relative '../../classes/genre'
require_relative '../../modules/user_interface'

class Genres < Collection
  include UserInterface

  def initialize(params = {})
    params[:filename] ||= "#{self.class.name.downcase}.json"
    params[:obj] ||= Genre
    super(params)
  end

  def create_new(full_params)
    full_params = create_params unless full_params[:name]
    params = { name: full_params[:name] }
    genre = already_has(params)

    if genre
      say_already_exist('Genre', genre.name)
      return genre
    end

    say_creating('Genre')
    genre = Genre.new(full_params)
    @collection << genre
    say_created('Genre', full_params[:name])
    genre
  end

  def list_all
    super do
      puts [
        'id'.ljust(10).to_s,
        'Name'.ljust(25).to_s,
        'Total Items'.ljust(10).to_s
      ].join(' | ')
      print_line({ char: '-', num: 100 })
    end
  end

  private

  def create_params
    { name: ask_for('the Genre [name]') }
  end
end
