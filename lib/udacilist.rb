class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title] ? options[:title] : "Untitled List"
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    @items.push TodoItem.new(description, options) if type == "todo"
    @items.push EventItem.new(description, options) if type == "event"
    @items.push LinkItem.new(description, options) if type == "link"
    if type != "todo" && type != "event" && type != "link"
      begin
        raise InvalidItemType
      rescue => error
        puts error
      end
    end
  end
  def delete(index)
    if index <= @items.length
      @items.delete_at(index - 1)
    else
      begin
        raise IndexExceedsListSize
      rescue => error
        puts error
      end
    end
  end
  def all
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end
