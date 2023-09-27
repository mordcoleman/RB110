=begin
P: given an array, sort in an ascending order, and only the odd numbers
  i: array
  o: array

E/D: sort_odd([5, 8, 6, 3, 4])  ==  [3, 8, 6, 5, 4]

A: high: iterate over array, compare each element to the next odd one, switch if it's more

   low: - iterate over array (2 loops or 2 uptos)
          - at each iteration check if number is odd
             - if num is odd, check for the following odd number
              - if that number is less than current number, swap places by re-assigning
              - if it's the more, move to next number
             - if number is even, move to next number
          - now, repeat the process for each number in the array, till the end
=end

def sort_odd(arr)
  0.upto(arr.size - 1) do |idx1|
    idx1.upto(arr.size - 1) do |idx2|
      (arr[idx1], arr[idx2] = arr[idx2], arr[idx1]) if arr[idx1].odd? && arr[idx2].odd? && arr[idx1] > arr[idx2]
    end
  end
  arr
end


p sort_odd([7, 1])  ==  [1, 7]
p sort_odd([5, 8, 6, 3, 4])  ==  [3, 8, 6, 5, 4]
p sort_odd([9, 8, 7, 6, 5, 4, 3, 2, 1, 0])  ==  [1, 8, 3, 6, 5, 4, 7, 2, 9, 0]
