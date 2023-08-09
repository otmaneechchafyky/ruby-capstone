require_relative '../item'
class Author < Item
  attr_accessor :id, :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @id = rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
    super({})
  end

  def add_item(item)
    return if @items.include?(item)

    @items << item
    item.author = self
  end

  def to_hash
    {
      id: @id,
      first_name: @first_name,
      last_name: @last_name
    }
  end
end
