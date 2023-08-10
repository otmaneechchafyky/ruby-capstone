require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(params)
    super(params)
    @on_spotify = params[:on_spotify]
  end

  def to_s
    "#{super} | On Spotify: #{yes_no(@on_spotify)}"
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
