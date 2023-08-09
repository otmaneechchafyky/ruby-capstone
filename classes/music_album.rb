require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(params)
    super(params)
    @on_spotify = params[:on_spotify]
  end
end
