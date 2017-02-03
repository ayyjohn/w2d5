require_relative 'p02_hashing'

class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count >= num_buckets
    unless self[key].include?(key)
      @count += 1
      self[key] << key
    end
    #hash it
    #mod by length
    #check for existence
    #increment count
    #add

  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    #check if key was in the bucket
    #if it was there decrement count
    #call delete on it
    @count -= 1 if self[key].include?(key)
    self[key].delete(key)
  end

  private

  def [](key)
    # optional but useful; return the bucket corresponding to `num`
    @store[key.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = HashSet.new(num_buckets * 2)
    @store.each do |bucket|
      bucket.each do |el|
        new_store.insert(el)
      end
    end
    @store = new_store.store
  end
end
