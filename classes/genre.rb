require 'json'

class Genre
  attr_reader :id, :items
  attr_accessor :name

  def initialize(params)
    @id = params[:id] || rand(1..10_000)
    @name = params[:name]
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.add_genre(self)
  end

  def to_s
    [
      @id.to_s.ljust(10).to_s,
      @name.ljust(25).to_s,
      @items.size.to_s.ljust(10).to_s
    ].join(' | ')
  end

  def to_hash(*_args)
    {
      id: @id,
      name: @name
    }
  end

  def to_json(*_args)
    JSON.dump(to_hash)
  end

  def self.from_json(json)
    parsed = JSON.parse(json)
    parsed.to_h { |k, v| [k.to_sym, v] }
  end
end
