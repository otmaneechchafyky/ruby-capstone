require_relative 'collection'
require_relative '../../classes/music_album'
require_relative '../../modules/data_handler'

class MusicAlbums < Collection
  include DataHandler

  def initialize(params = {})
    super(params)
  end

  def create_new(params)
    params.merge!(create_params)
    say_creating('MusicAlbum')
    music_album = MusicAlbum.new(params)
    @collection << music_album
    say_created('MusicAlbum')
    music_album
  end

  def list_all
    return say_nothing_to_list('MusicAlbums') if empty?

    print_title('List all MusicAlbums')
    super
  end

  private

  def create_params
    {
      publish_date: ask_for('the MusicAlbum [publish date] (yyyy/mm/dd)'),
      on_spotify: true_false(ask_for('MusicAlbum is [on spotify] (y/n)?'))
    }
  end
end
