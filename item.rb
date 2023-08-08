class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived
  attr_reader :related_items

  def initialize(params)
    @id = params[:id]
    @genre = params[:genre]
    @author = params[:author]
    @source = params[:source]
    @label = params[:label]
    @publish_date = params[:publish_date]
    @archived = params[:archived] || false
    @related_items = []
    super()
  end

  def add_related_items(item)
    @related_items << item
  end
end
