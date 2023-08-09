require 'date'
class Item
  attr_accessor :publish_date, :archived, :id, :name
  attr_reader :genre, :label, :author

  # attr_accessor :publish_date, :genre, :author, :label
  # attr_reader :id, :archived

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def genre=(genre)
    @genre = genre
    @genre.items.push(self) unless @genre.items.include?(self)
  end

  def label=(label)
    @label = label
    @label.items.push(self) unless @label.items.include?(self)
  end

  def author=(author)
    @author = author
    @author.items.push(self) unless @author.items.include?(self)
  end

  def can_be_archived?(item)
    return true if (Date.today - Date.parse(item.publish_date)).to_i / 365 >= 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
