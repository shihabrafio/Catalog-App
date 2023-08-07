require_relative 'item'

class Label < Item
  def initialize(id,title,color,items)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    items = []
  end

  def add_item(item)
    @items.push(item)
  end
end
