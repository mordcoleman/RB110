require 'pry'
=begin
P: given an array of integers, find index N where the sum of integers on th
   left of N is equal to that of the right.
  i: array
  o: integer
  rules: if none, return -1

E / D: find_even_index[1,2,3,4,3,2,1]) == 3
       numbers on either side of 4, the number at index 3, add up to 6

A: - iterate over array
   - at each index, check sum of numbers on each side
      - for [1,2,3,4,3,2,1], add a[0...0] and a[1..-1]
   - if equal, return index
   - if not, move to next index
=end

def find_even_index(arr)
  arr.each_index do |index|
    return index if arr[0...index].sum == arr[(index + 1)..-1].sum
  end
  return -1
end

p find_even_index([1,2,3,4,3,2,1]) == 3
