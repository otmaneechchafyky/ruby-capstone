class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title)
    @id = rand(1..100_000)
    @items = []
    @title = title
    @color = 'green'
  end

  def add_item(item)
    items << item
    item.label = self
  end
end
