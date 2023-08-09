class Author
  attr_accessor :first_name, :last_name
  attr_reader :items
  private

  attr_accessor :id

  public

  def initialize(fname, lname)
    @id = rand(0..100)
    @first_name = fname
    @last_name = lname
    @items = []
  end

  def add_item(item)
    item.author = self
    @items << item unless @items.include? item
  end

  def list_items_with_author
    @items.each_with_index do |item, ind|
      puts ind + 1
      puts "Publish date : #{item.publish_date}"
      puts "Author : #{item.author.first_name} #{item.author.last_name}"
      puts ''
    end
  end
end
