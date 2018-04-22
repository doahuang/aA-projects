require 'byebug'
# warmup
def range(start_num, end_num)
  return end_num - 1 < start_num ? [] : [start_num] + range(start_num + 1, end_num)
end
#
def irange(start_num, end_num)
  output = []
  for i in (start_num...end_num)
    output << i
  end
  output
end

def sum(array)
  return array.last if array.length <= 1
  sum(array[0...-1]) + array.last
end

def isum(array)
  total = 0
  array.each do |num|
    total += num
  end
  total
end

def exp_one(base, power)
  return 1 if power == 0
  p power
  base * exp_one(base, power - 1)
end

def exp_two(base, power)
  return 1 if power == 0
  return base if power == 1

  if power.even?
    # debugger
    new_base = exp_two(base, power / 2)

  else
    new_base = exp_two(base, (power - 1) / 2 )
  end
  new_base * new_base
end


class Array
  def deep_dup
    return self.dup unless self.any?{|el| el.is_a?(Array)}
    self.map do |el|
      if el.is_a?(Array)
        el.deep_dup
      else
        el.dup
      end
    end
  end
end

def fib(n)
  return [1] if n == 1
  return [1, 1] if n == 2
  seq = fib(n - 1)
  nth_fib = seq[-2] + seq[-1]
  seq << nth_fib
end

def ifib(n)
  seq = [1, 1]
  return [1] if n == 1
  return seq if n == 2
  while seq.length < n
    seq << seq[-2] + seq[-1]
  end
  seq
end

#return 0 if array[0] == target

def bsearch(array,target)
  if array.length <= 1
    return array[0] == target ? 0 : nil
  end

  mid_idx = (array.length - 1) /2
  mid_el = array[mid_idx]

  return mid_idx if target == mid_el

  if target > mid_el
    next_array = array[(mid_idx + 1).. -1]
    searched_idx = bsearch(next_array, target)
    searched_idx.nil? ? nil : mid_idx + 1 + searched_idx
  else
    next_array = array[0...mid_idx]
    bsearch(next_array, target)
  end
end

def merge_sort(array)
  return array if array.length == 1
  left = array.take(array.length/2)
  right = array.drop(array.length/2)
  merge(merge_sort(left), merge_sort(right))
end

def merge(array1, array2)
  #  [3,4,6]  [1,2,5]
  #  new [] => [1,2,3,4,5]
  merged_array = []

  while array1.length > 0 && array2.length > 0
    if array1[0] < array2[0]
      merged_array << array1.shift
    else
      merged_array << array2.shift
    end
  end

  merged_array += array1 + array2
end


def subsets(array)
  return [[]] if array.empty?
  previous_subset = subsets(array[0...-1])
  new_subset = previous_subset.map{ |arr| arr + [array.last] }
  previous_subset + new_subset
end


def permutations(array)
  return [[]] if array.empty?
  return [array] if array.length == 1


  array.each_index.reduce([]) do |acc, idx|

    el = array[idx]
    rest_el = array.take(idx) + array.drop(idx + 1)
    rest_perms = permutations(rest_el)

    acc + rest_perms.map { |ar| [el] + ar }
    # debugger
  end

end

def greedy_make_change(number)
  COINS = [25, 10, 5, 1]
  


end















#
