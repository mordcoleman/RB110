=begin
P: given an array of integers (nums) and an integer(target), return indices
   of the 2 number such that they add up to target

   explict: assume each has one answer
            can't reuse nums
            any order

E/D: two_sum([2, 11, 7, 15], 9) == [0, 2]

A: high: iterate over the area, retrieving all 2 element subs, and their indices,
   check if the numbers equalt target, if so return indices

   low: - init results array
        - iterate over the array
           - start from first, extract it and next, then it and 2 away etc
             - go to next, it and next etc
             - only return one that equals target, to result

        - iterate over result, and arr return indexes of numbers in sub
=end

def two_sum(arr, target)
  result = []

  0.upto(arr.size - 1) do |idx1|
    idx1.upto(arr.size - 1) do |idx2|
    result << [arr[idx1], arr[idx2]] if [arr[idx1], arr[idx2]].sum == target
    end
  end

  result = result.flatten.uniq

  result.map do |num|
    arr.index(num)
  end
end

# p two_sum([2, 11, 7, 15], 9) == [0, 2]
# p two_sum([3, 2, 4], 6) == [1, 2]
p two_sum([3, 3], 6) #== [0, 1]


def two_sum(arr, sum)
  target_index = []
  start_index = 0
  next_index = 1

  loop do
    loop do
      target_index = [start_index, next_index] if (arr[start_index] + arr[next_index]) == sum
      next_index += 1

      break if next_index == (arr.size) || !target_index.empty?
    end
    start_index += 1
    next_index = start_index + 1

    break if next_index == (arr.size) || !target_index.empty?
  end
  target_index
end
