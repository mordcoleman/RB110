=begin
P: given a number(n), return the difference btwn the square of the sum of the
   the first n positive numbers and the of the squares of the first n pos. integers
  i; integer
  o: integer

E/D: sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)

   A: high: get an array with all numbers from 1 till n, sum them and square that,
             then subtract the sum off all those numbers squared individually

       low: - create array of 1 to n
              (1..n).to_a
            - get sum of array and square it, save to var
            - get square of each num and sum all together(map, sum), save to var
            - subtract second var from first
=end


def sum_square_difference(n)
  arr = (1..n).to_a
  sum_square = arr.sum**2
  square_sum = arr.map do |num|
    num**2
  end.sum
  sum_square - square_sum
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
