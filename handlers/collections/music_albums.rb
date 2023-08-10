require_relative 'collection'
require_relative '../../classes/genre'
# require_relative '../../classes/author'
# require_relative '../../classes/source'
# require_relative '../../classes/label'
require_relative '../../classes/music_album'
require_relative '../../modules/user_interface'

class MusicAlbums < Collection
  include UserInterface

  def initialize(params = { dependencies: { genres: nil, authors: nil, sources: nil, labels: nil } })
    params[:filename] ||= "#{self.class.name.downcase}.json"
    params[:obj] ||= MusicAlbum
    super(params)
  end

  def create_new(params)
    return say_missing('genre', 'MusicAlbum') unless params[:genre]

    say_creating('MusicAlbum')
    new_album = MusicAlbum.new(create_params)
    @collection << new_album
    params[:genre].add_item(new_album)
    say_created('MusicAlbum')
    new_album
  end

  def load(params = {})
    super do
      hash_elem = @obj.from_json(params[:json])
      album = @obj.new(hash_elem)

      instances = %i[genre author source label]

      instances.each do |instance|
        dependecy = "#{instance}s".to_sym
        obj_id = "#{instance}_id".to_sym
        obj = look_for(hash_elem[obj_id], params[dependecy])
        obj&.add_item(album)
      end

      album
    end
  end

  private

  def look_for(elem_id, dependecy)
    dependecy&.select_by({ id: elem_id })
  end

  def create_params
    {
      publish_date: ask_for('the MusicAlbum [publish date] (yyyy/mm/dd)'),
      on_spotify: true_false(ask_for('MusicAlbum is [on spotify] (y/n)?'))
    }
  end
end
