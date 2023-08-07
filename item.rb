class Item
  attr_accessor :publish_date, :archived, :id, :name
  attr_reader :genre, :author, :label

  def initialize(name, publish_date, archied: false)
    @id = Random.rand(1..1000)
    @name = name
    @publish_date = publish_date
    @archived = archied
  end

  def genre=(genre)
    @genre = genre
    @genre.items.push(self) unless @genre.items.include?(self)
  end

  def author=(author)
    @author = author
    @author.items.push(self) unless @author.items.include?(self)
  end

  def label=(label)
    @label = label
    @label.items.push(self) unless @label.items.include?(self)
  end

  def can_be_archived?
    current_date = Time.now
    publish_year = current_date.year
    publish_year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
