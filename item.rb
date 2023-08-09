require 'date'

class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived
  attr_reader :related_items

  def initialize(params)
    @id = params[:id]
    @genre = params[:genre]
    @author = params[:author]
    @source = params[:source]
    @label = params[:label]
    @publish_date = create_date(params[:publish_date])
    @archived = params[:archived] || false
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_source(source)
    @source = source
  end

  def add_label(label)
    @label = label
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    return true if (Date.today - @publish_date).to_i / 365 > 10

    false
  end

  def create_date(date_str)
    return nil if date_str.nil?

    Date.parse(date_str)
  end
end
