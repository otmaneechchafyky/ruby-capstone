require 'json'
require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(params)
    super(params)
    @on_spotify = params[:on_spotify]
  end

  def to_s
    [
      super.to_s,
      "On Spotify: #{yes_no(@on_spotify)}"
    ].join(' | ')
  end

  def to_hash(*args)
    super.merge({
                  on_spotify: @on_spotify
                })
  end

  def to_json(*_args)
    JSON.dump(to_hash)
  end

  def self.from_json(json)
    parsed = JSON.parse(json)
    parsed.to_h { |k, v| [k.to_sym, v] }
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
