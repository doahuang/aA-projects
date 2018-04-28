require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == num_buckets
    unless self.include?(key)
      self[key] << key 
      @count += 1
    end
  end

  def include?(key)
    self[key].include?(key)  
  end

  def remove(key)
    if include?(key)
      self[key].delete(key) 
      @count -= 1
    end
  end

  private

  def [](entry)
    # optional but useful; return the bucket corresponding to `num`
    @store[entry.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_set = Array.new(num_buckets * 2) {[]}
    @store.each do |bucket|
      bucket.each do |entry|
        new_bucket = entry.hash % new_set.length
        new_set[new_bucket] << entry
      end
    end
    @store = new_set
  end
end
