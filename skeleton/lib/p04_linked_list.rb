class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

end

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    if empty?
      return nil
    else
      @head.next
    end
  end

  def last
    if empty?
      return nil
    else
      @tail.prev
    end
  end

  def empty?
    @head.next == @tail
  end

  def get(key)

  end

  def include?(key)
    any? { |link| link.key == key }
  end

  def insert(key, val)
    if self.include?(key)
      self.each do |link|
        return link.val = val if link.key == key
      end
    else
      inserted_link  = Link.new(key,val)
      @tail.prev.next = inserted_link
      inserted_link.prev = @tail.prev
      inserted_link.next = @tail
       @tail.prev = inserted_link
    end
  end

 #   each { |link| return link.val = val if link.key == key }


  def remove(key)
    each do |link|
      if link.key == key
        link.prev.next = link.next
        link.next.prev = link.prev
        link.next, link.prev = nil, nil
        return link.val
      end
    end
    nil
  end

        # link.prev.next = link.next
        # link.next.prev = link.prev
        # link.next, link.prev = nil, nil

  def each
    current = @head.next
    until current == @tail
      yield current
      current = current.next
    end
  end


  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
