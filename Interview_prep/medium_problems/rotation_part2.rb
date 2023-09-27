=begin
P: given 2 numbers, return a new number which has the amount of the second number given
   digits rotated (n)
  i: number
  o: number
  rules: rotating one leaves it the same
         assume the second number is positive

E/D: rotate_rightmost_digits(735291, 4) == 732915
     here, the 4th digit from the right is moved to the end

A: - convert num to array of chars
     - convert to string
     - convert to array of chars
   - create sub the size of n from end of number
       a = [7,3,2,9,1,5] a[-3..-1] = [9,1,5]
   - call rotate_array method on the sub
   - return new array joined together
       a[0...-3] + a[-3..-1]
   - convert back to integer
=end

def rotate_array(arr)
  arr[1..-1] << arr[0]
end

def rotate_rightmost_digits(integer, n)
  arr = integer.to_s.chars
  rotated = rotate_array(arr[-n..-1])
  (arr[0...-n] + rotated).join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
