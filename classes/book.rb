require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(params)
    super(params)
    @publisher = params[:publisher]
    @cover_state = params[:cover_state]
  end

  private

  def can_be_archived?
    return true if super || cover_state == 'bad'

    false
  end
end
