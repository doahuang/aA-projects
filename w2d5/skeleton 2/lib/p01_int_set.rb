class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num > @store.length || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    return false unless @store[num]
    true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket = num % num_buckets
    self[num] << num
  end

  def remove(num)
    bucket = num % num_buckets
    if self[num].include?(num)
      self[num].delete(num)
    end
  end

  def include?(num)
    return false unless self[num].include?(num)
    true
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count == 20
    unless self[num].include?(num)
      self[num] << num
      @count += 1
    end    
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    return false unless self[num].include?(num)
    true
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_set = Array.new(num_buckets * 2) {[]}
    @store.each do |bucket|
      bucket.each do |entry|
        new_bucket = entry % new_set.length
        new_set[new_bucket] << entry          
      end
    end
    @store = new_set
  end
end
