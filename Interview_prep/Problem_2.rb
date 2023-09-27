=begin
---------------- Problem
Input: array of integers
Output: minimum sum of 5 consecutive integers
        - if there are less than 5 integers, return nil

---------------- Examples (modeling)



---------------- Data Structures



---------------- Algorithm
  - create results array
  - iterate over array, retrieving all possible substrings
    - use 1 upto to iterate from beginning to end
    - use second upto to iterate from current element till the end
    - at each iteration, extract from the array a subarray, beginning with current
      element in outer upto till the element in the inner upto
  - add all to result array
  - remove subs less than 5 in size
  - iterate over result array, retrieve smallest sum using min_by?
=end

def minimum_sum(arr)
  return nil if arr.size < 5
  result = []
  0.upto(arr.size - 1) do |idx1|
    idx1.upto(arr.size - 1) do |idx2|
      result << arr[idx1..idx2]
    end
  end
  result = result.select {|sub| sub.size == 5}
  result.min_by{|sub| sub.sum}.sum
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
