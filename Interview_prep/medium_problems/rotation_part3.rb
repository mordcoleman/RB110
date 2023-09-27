require "pry"
=begin
P: given a number, return the max rotation of that number. that is, rotate left once,
   first number to the end, then the same for the second number, and so on to the last 2.
  i: number
  o: number
  rules: no leading zeroes?

E/D: max_rotation(735291) == 321579

A: - determine how many digits (times)
   - loop times down to second to least digit
     - assign  variable to the result of rotate_rightmost_digits, passing current time,
     which will serve as the strating point for the substring, each time smaller
   - return final number
=end


def rotate_array(arr)
  arr[1..-1] << arr[0]
end

def rotate_rightmost_digits(integer, n)
  arr = integer.to_s.chars
  rotated = rotate_array(arr[-n..-1])
  (arr[0...-n] + rotated).join.to_i
end

def max_rotation(number)
  number_digits = number.to_s.size
  number_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
