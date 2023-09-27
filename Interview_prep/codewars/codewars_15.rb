=begin
P: given an array, find the uniq one
 i: array
 o: integer

E / D: find_uniq([ 1, 1, 1, 2, 1, 1 ]) ==  2

A: - iterate over the array
   - at each iteration, check if the countof current number == 1
   - if yes, return number
=end

def find_uniq(arr)
  arr.each do |num|
    return num if arr.count(num) == 1
  end
end

p find_uniq([ 1, 1, 1, 2, 1, 1 ]) ==  2
