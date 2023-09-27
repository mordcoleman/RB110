require 'pry'
=begin
P: given 3 numbers as lengths of sides in a triangle, check wich type of triangle
   it is, or if it's invalid.
  i: 3 integers
  o: symbol
  rules: to be valid, a triangle must a) have the two shortest sides sum more than
        the longest side, b) no side can equal 0
        eq: all sides =
        is: 2 equal, one dif
        sca: all sides dif

E/D: triangle(3, 3, 3) == :equilateral
   array

A: high: need to check if any are 0, then reverse sort, check if first 2 > last, then check
      if all are the same, then if all are different

    low: - init num array and put nums in
         - sort num array
         - check if first 2 sum more then 3
            num_array.first(2).sum <= num_array.last
         - check if includes 0
         - if either is true, return :invalid

         - check if all are the same
           - compare all to num_array.first
         - if so, retrun :equilateral
         - if not, check if all are different
            - take num_array.first, then compare it to others by iterated over the
              rest of the array
         - if so return :scalene
         - other wise return :isosceles

=end

def triangle(s1, s2, s3)
sides = [s1, s2, s3]
sides = sides.sort
#binding.pry
  if sides.include?(0) || sides.first(2).sum <= sides.last
    :invalid
  elsif sides.all? {|side| sides[0] == side}
    :equilateral
  elsif s1 == s2 || s1 == s3 || s2 == s3
    :isosceles
  else
    :scalene
  end
end


p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
