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

  # def inspect
  #   puts "key = #{@key}, val is #{@val}"
  # end
  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize()
    @sentinal_one = Link.new
    @sentinal_two = Link.new

    @sentinal_one.next = @sentinal_two
    @sentinal_two.prev = @sentinal_one

  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @sentinal_one.next
  end

  def last
    @sentinal_two.prev
  end

  def empty?
    @sentinal_one.next == @sentinal_two
  end

  def get(key)
    current_link = @sentinal_one.next
    until current_link.key == key
      return nil if current_link.next == @sentinal_two
      current_link = current_link.next
    end
    current_link.val
  end

  def include?(key)
    current_link = @sentinal_one.next
    until current_link == @sentinal_two
      return true if current_link.key == key
      current_link = current_link.next
    end
    false
  end

  def append(key, val)
    # create unattached new link
    new_link = Link.new(key, val)

    #update old last
    @sentinal_two.prev.next = new_link
    new_link.prev = @sentinal_two.prev

    #attach new link
    @sentinal_two.prev = new_link
    new_link.next = @sentinal_two
  end

  def update(key, val)
    return "wasn't there" if empty?
    current_link = @sentinal_one.next
    until current_link.key == key
      return "wasn't there" if current_link.next == @sentinal_one
      current_link = current_link.next
    end
    current_link.val = val
  end

  def render
    current = @sentinal_one
    until current == @sentinal_two
      puts "key: #{current.key}, val: #{current.val}"
      puts "prev: #{current.prev}, next: #{current.next}"
      puts
      current = current.next
    end
  end


  def remove(key)
    current_link = @sentinal_one.next
    until current_link.key == key
      return nil if current_link.next == @sentinal_two
      current_link = current_link.next
    end

    current_link.prev.next = current_link.next
    current_link.next.prev = current_link.prev
  end

  def each(&prc)
    current_link = @sentinal_one.next
    until current_link == @sentinal_two
      prc.call(current_link)
      current_link = current_link.next
    end
    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
