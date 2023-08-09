require_relative '../item'
require 'date'
class Game < Item
  attr_accessor :multiplayer, :played_at_date
  attr_reader :authors

  def initialize(multiplayer, played_at_date, params)
    super(params)
    @multiplayer = multiplayer
    @played_at_date = played_at_date
    @can_be_archived = false
    @publish_date = Date.today
    @authors = []
  end

  def associate_with_author(author)
    author.add_item(self)
    @authors = [author] # Store the association with the author
  end

  def can_be_archived?
    super && (Date.today - @played_at_date).to_i / 365 > 2
  end

  def to_hash
    {
      multiplayer: @multiplayer,
      played_at_date: @played_at_date
    }
  end
end
