require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(genre, author, source, label, publish_date, archived, publisher, cover_state)
    super(
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

  private

  def can_be_archived?
    return true if super || cover_state == 'bad'

    false
  end
end
book = Book.new('Math', 'Otmane', 'Morocco', 'labeltest', '2022-12-12', true, 'publisher', 'Not bad')
puts book.inspect
