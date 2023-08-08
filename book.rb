require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(id, genre, author, source, label, publish_date, archived, publisher, cover_state)
    super(
      id: id,
      genre: genre,
      author: author,
      source: source,
      label: label,
      publish_date: publish_date,
      archived: archived
    )
    @publisher = publisher
    @cover_state = cover_state
  end
end
