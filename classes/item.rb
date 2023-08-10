require 'date'
require_relative '../modules/data_handler'

class Item
  include DataHandler

  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived
  attr_reader :related_items

  def initialize(params)
    @id = params[:id] || rand(1..10_000)
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

  def to_s
    to_print = [
      "id: #{@id}",
      "genre: #{@genre&.name}",
      "author: #{@author}",
      "source: #{@source}",
      "label: #{@label}",
      "publish date: #{@publish_date}",
      "archived: #{yes_no(@archived)}"
    ]
    to_print.join(' | ')
  end

  private

  def can_be_archived?
    return true if (Date.today - @publish_date).to_i / 365 > 10

    false
  end

  def create_date(date_str)
    Date.parse(date_str)
  end
end
