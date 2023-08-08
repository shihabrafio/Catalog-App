require 'date'
class Item
  # attr_accessor :publish_date, :archived, :id, :name
  # attr_reader :genre, :author, :label

  attr_accessor :publish_date, :genre, :author, :label
  attr_reader :id, :archived

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
    @author=nil
  end

  def genre=(genre)
    @genre = genre
    @genre.items.push(self) unless @genre.items.include?(self)
  end

  def author=(author)
    @author = author
  end

  def label=(label)
    @label = label
    @label.items.push(self) unless @label.items.include?(self)
  end

  def can_be_archived?(item)
    return true if (Date.today - Date.parse(item.publish_date)).to_i / 365 >= 10
    # current_date = Time.now
    # publish_year = Date.strptime(@publish_date, '%Y-%m-%d').strftime('%Y').to_i
    # current_date - publish_year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
