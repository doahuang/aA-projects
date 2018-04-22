require 'byebug'

class Array

  def my_each(&blk)

    self.size.times do |i|
      blk.call(self[i])
    end

    self
  end

  def my_select(&blk)
    selected = []
    self.my_each do |el|
      selected << el if blk.call(el)
    end
    selected
  end

  def my_reject(&blk)
    rejected = []
    self.my_each do |el|
      rejected << el if !blk.call(el)
    end
    rejected
  end

  def my_any?(&blk)

    self.my_each do |el|

      return true if blk.call(el)

    end

    false
  end


  def my_all?(&blk)
    self.my_any? { |el| return false if !blk.call(el)  }
    true
  end

  def my_flatten

    flatten = []

    self.my_each do |el|

      if !el.is_a?(Array)
        flatten << el
      else
        flatten += el.my_flatten
      end
    end

    flatten
  end

  def my_zip(*args)

    zipped = Array.new(self.length) { Array.new(args.length + 1 ) }

    zipped.length.times do |i|
      zipped[i][0]= self[i]
    end
    # debugger
    args.length.times do |j|
      args[j].length.times do |i|
        if i < zipped.length
          zipped[i][j + 1] = args[j][i]
        end
      end
    end

    zipped
  end

  def my_rotate(offset = 1)

    offset = offset % self.length
    self.drop(offset) + self.take(offset)
  end

  def my_join(separator = "")

    joined = self.reduce("") { |result, str| result + str + separator}
    return joined[0...-1] if joined[-1] == separator

    joined
  end

  def my_reverse
    reversed = []

    (self.size - 1).downto(0) do |i|
      reversed << self[i]
    end

    reversed
  end


end
