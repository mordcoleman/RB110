=begin
---------------- Problem
Input: array of integers
Output: the two numbers that are closest together in value


---------------- Examples (modeling)



---------------- Data Structures



---------------- Algorithm
- initialize result array
- iterate over array
- retrieve subarrays of all pairs
  - use outer upto to iterate from beginning to end
  - use inner upto to iterate from current element till the end
  - at each iteration, extract a subarray, with current element in
    the outer upto and the element in the inner upto, if different
- iterate over subarrys, retrieving results of larger number minus smaller number
  - sort elements in array
- return the array w/ the smallest answer using min_by
=end

def closest_numbers(arr)
  result = []
  0.upto(arr.size - 1) do |idx1|
    idx1.upto(arr.size - 1) do |idx2|
      result << [arr[idx1], arr[idx2]] if arr[idx1] != arr[idx2]
    end
  end
  result.min_by {|sub| sub.sort{|a, b| b <=> a}.inject(:-)}
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]
