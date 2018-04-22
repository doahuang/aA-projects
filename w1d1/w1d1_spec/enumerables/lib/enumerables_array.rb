def factors(num)

  (1..num).select { |n|  num % n == 0 }
end

class Array
  def bubble_sort!(&prc)
    sorted = false
    prc ||= Proc.new{ |a, b| a <=> b }

    while !sorted
      sorted = true
      (0...self.length - 1).each do |i|

        if prc.call(self[i], self[i+1]) == 1
          self[i+1], self[i] = self[i], self[i+1]
          sorted = false
        end

      end

    end
    self
  end

  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end

  def my_inject(&blk)
    acc = self.first

    self.drop(1).each do |el|
      acc = blk.call(acc, el)
    end
  end
end

def concatenate(strings)
  strings.inject("") do |acc, el|
    acc << el
  end
end


def subwords(word, dictionary)
  dictionary.select do |w|
    w if word.include?(w)
  end
end

def doubler(arr)
  arr.map { |el| el * 2 }
end
