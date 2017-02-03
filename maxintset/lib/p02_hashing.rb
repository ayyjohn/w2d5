class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    #use the index, values, length, order
    #take i + v + (l*9999) ... hash total
    total = 163
    len = self.length
    each_with_index do |el, i|

      el = el.to_s.ord if el.is_a?(Symbol)
      el = el.ord if el.is_a?(String)

      total += (el + i).hash
    end
    total.hash
  end
end

class String
  def hash
    (chars.map(&:ord)).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    total = 163
    to_a.sort.each { |sub_array| total += sub_array.hash }
    total.hash
  end
end
