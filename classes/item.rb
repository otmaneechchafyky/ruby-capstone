require 'date'
require_relative '../modules/user_interface'

class Item
  include UserInterface

  attr_accessor :publish_date
  attr_reader :id, :archived, :genre, :author, :source, :label

  def initialize(params)
    @id = params[:id] || rand(1..100_000)
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
    label.add_item(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def to_s
    [
      "id: #{@id}",
      "genre: #{@genre&.name}",
      "author: #{@author&.first_name} #{@author&.last_name}",
      "source: #{@source&.name}",
      "label: #{@label&.title}",
      "publish date: #{@publish_date}",
      "archived: #{yes_no(@archived)}"
    ].join(' | ')
  end

  def to_hash(*_args)
    {
      id: @id,
      genre_id: @genre&.id,
      author_id: @author&.id,
      source_id: @source&.id,
      label_id: @label&.id,
      publish_date: @publish_date,
      archived: @archived
    }
  end

  private

  def can_be_archived?
    return true if (Date.today - @publish_date).to_i / 365 > 10

    false
  end

  def create_date(date_str)
    return nil if date_str.nil?

    Date.parse(date_str.to_s)
  end
end
