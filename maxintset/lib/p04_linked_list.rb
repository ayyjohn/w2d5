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
  end

  def include?(key)
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
    current_link = @sentinal_one.next
    until current_link.key = key
      current_link = current_link.next
    end
    current_link.val = val
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
