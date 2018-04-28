class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    # [1,2,3].hash = [1,2,3].hash
    # [1,2,3].hash != [3,2,1].hash
    hash_code = self.map.with_index do |el, idx|
      el = el.hash * length
    end
    hash_code.join.to_i
  end
end

class String
  def hash
    hash_code = self.chars.map.with_index do |el, idx|
      el = el.ord.hash * length
    end
    hash_code.join.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    # [[:a, 1], [:b, 2], [:c. 3]]
    array = self.to_a.sort_by{ |pair| pair.first }
    hash_code = array.map do |sub_arr|
      sub_arr.map do |el|
        el.is_a?(Symbol) ? el.to_s.hash : el.hash
      end
    end
    hash_code.flatten.join.to_i * length
  end
end
