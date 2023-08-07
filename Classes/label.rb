require_relative 'item'

class Label < Item
  attr_accessor :title, :color, :items

  def initialize(_id, title, color, _items)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
    super
  end

  def add_item(item)
    @items.push(item)
  end
end
