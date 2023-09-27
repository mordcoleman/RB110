=begin
P: given an array,return the maximum sum of a substring in the array
  i: array
  o: integer
   implicit: if empty or negative number, sum will be zero

E/D: max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
                 4 + -1 + 2 + 1 = 6

A: high: extract every substring, get the sum of each, return the largest

   low: - init array for subs
        - return 0 if empty or negative
        - iterate over array, retrieving all substrings, add to sub array
        - iterate over sub array, return the maximum array in terms of sum
        - return that sum
=end

def max_sequence(arr)
  subs = []
  return 0 if arr.empty? || arr[0] < 0 && arr.size == 1

  0.upto(arr.size - 1) do |idx1|
    idx1.upto(arr.size - 1)do |idx2|
      subs << arr[idx1..idx2]
    end
  end
  subs.max_by {|sub| sub.sum}.sum
end

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
