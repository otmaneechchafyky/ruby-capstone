require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :played_at_date
  attr_reader :authors

  def initialize(params)
    super(params)
    @multiplayer = params[:multiplayer]
    @played_at_date = params[:played_at_date]
  end

  def to_hash
    {
      multiplayer: @multiplayer,
      played_at_date: @played_at_date
    }
  end

  private

  def can_be_archived?
    super && (Date.today - @played_at_date).to_i / 365 > 2
  end
end
