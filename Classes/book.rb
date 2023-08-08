require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(author, publisher, cover_state, publish_date)
    super(publish_date)
    @author = author
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    if @cover_state || super == 'bad'
      true
    else
      false
    end
  end
end
