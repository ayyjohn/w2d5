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
      total += (el + i).hash
    end
    total.hash
  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
